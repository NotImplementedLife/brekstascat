/**
 * BRKC_PuzzleMaker
 * 
 * Tool for creating puzzles for Breksta's Cat game of HomebrewOwl.GB
 * 
 * This program converts an image to a sliding puzzle resource ready to be
 * included in BRKC's ROM. 
 * 
 * 
 * This program converts images based on their size, in the following way:
 * 
 * -   96x96 px => a 3x3 sliding puzzle with pieces of size 4x4 tiles (32x32 px)
 * - 128x128 px => a 4x4 sliding puzzle with pieces of size 4x4 tiles (32x32 px)
 * -   80x80 px => a 5x5 sliding puzzle with pieces of size 2x2 tiles (16x16 px)
 * 
 * (A)RGB color is converted to Gameboy color in the following way:
 * 
 *                Gameboy Palette Index = 3 - ((R+G+B)/3)/64,
 *                then swap indices 0 and 3.          
 * 
 * Requirements/Limitations:
 * 
 *  - final maximum number of tiles is 226. This program won't convert an image which results in 
 *    more than 226 tiles.
 *  - image must be of sizes 80x80, 96x96, 128x128 px.
 */

using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BRKC_PuzzleMaker
{
    class Program
    {
        static Bitmap bmp = null;

        static void Main(string[] args)
        {
            if (args.Length != 1) 
            {
                throw new ArgumentException("Command accepts only one argument.");
            }
            var fn = args[0];
            if(!File.Exists(fn))
            {
                throw new FileNotFoundException($"File not found: {fn}.", fn);
            }         
            try
            {
                bmp = new Bitmap(fn);
            }
            catch(Exception)
            {
                throw new ArgumentException("File is corrupt or is not an image.");
            }

            var w = bmp.Width;
            var h = bmp.Height;
            int sptype = 0;

            if (w != h)
                throw new ArgumentException("Image must be 96x96, 128x128 or 80x80 pixels.");

            if (w != 96 && w != 128 && w != 80)
                throw new ArgumentException("Image must be 96x96, 128x128 or 80x80 pixels.");

            if (w == 96)
            {
                sptype = 3;
            }
            else if (w == 128)
            {
                sptype = 4;
            }
            else if (w == 80)
            {
                sptype = 5;
            }

            Console.WriteLine($"Image size : ({w}px, {h}px)");

            PxSquare psq = new PxSquare(bmp);

            List<Tile816> Tiles816 = new List<Tile816>();
            List<int> Ids816 = new List<int>();

            for (int r = 0; 16 * r < h; r++) 
            {
                for (int c = 0; 8 * c < w; c++)
                {
                    var t816 = new Tile816(psq, r, c);
                    Tiles816.Add(t816);
                    Ids816.Add(Tiles816.Count - 1);
                    //Console.WriteLine(string.Join(", ", t816.Bytes.Select(b => $"0x{b.ToString("X2").PadLeft(2, '0')}")));
                    //Console.WriteLine(Ids816.Last());
                }
            }

            int distinct = Tiles816.Count;
            for(int i=0;i<Tiles816.Count;i++)
            {
                for (int j = i + 1; j < Tiles816.Count; j++) 
                {
                    if (Ids816[j] == j)
                    {
                        if (Tiles816[i].Equals(Tiles816[j]))
                        {
                            Ids816[j] = i;
                            distinct--;
                            //for(int k=)
                        }
                    }
                }
            }

            if(2*Tiles816.Count>226)
            {
                throw new OutOfMemoryException("Image converts to more than 226 tiles");
            }
            //for (int i = 0; i < Tiles816.Count; i++) Console.Write($"{Ids816[i]} ");
            Console.WriteLine();
            Console.WriteLine($"Image converts to {2 * distinct} tiles out of a maximum of {Math.Min(2 * Tiles816.Count, 226)}.");
            Console.WriteLine($"Compression ratio of {(float)(distinct * 100 / Tiles816.Count)}%");

            string tilesetStr = "";
            var dlist = Ids816.Distinct().ToList();           
            for(int i=0;i<dlist.Count;i++)
            {
                var t = Tiles816[dlist[i]];
                t.Id = i;
                tilesetStr += t.ToString() + "\n";          
            }
            /*for (int i = 0; i < Tiles816.Count; i++) 
            {
                Console.Write($"{Tiles816[Ids816[i]].Id} ");
            }*/
            Console.WriteLine();
            //Console.WriteLine(tilesetStr);            


            Tilemap tm = new Tilemap(w / 8);

            for (int r = 0; r < tm.Dim; r += 2) 
            {
                for (int c = 0; c < tm.Dim; c++)
                {
                    int id816 = (r / 2) * tm.Dim + c;
                    tm.SetTile(r, c, Tiles816[Ids816[id816]].Id);
                }
            }

            int totalSize = 32 * distinct + tm.Dim * tm.Dim;

            Console.WriteLine($"Total sliding puzzle size: 0x{totalSize.ToString("X2")} bytes.");

            var filewe = Path.GetFileNameWithoutExtension(fn);
            var dir = Path.GetDirectoryName(fn);
            Console.WriteLine("Writing to file...");
            using (var f = new StreamWriter(File.Create(Path.Combine(dir, filewe + ".asm"))))
            {
                f.WriteLine($"; This file was generated automatically by BRKC_PuzzleMaker at {DateTime.Now}.");
                f.WriteLine($"; This is a {sptype}x{sptype} sliding puzzle and must be registered in the puzzles list of BRKC.");
                f.WriteLine();
                f.WriteLine();
                f.WriteLine("; SRAM Highscore");
                f.WriteLine();
                f.WriteLine($"SECTION \"SLP_{filewe} HighScore\", SRAM\n");
                f.WriteLine($"SLP_{filewe}_HighScore::");
                f.WriteLine($"  DS 2\n");

                f.WriteLine($"SECTION \"Sliding Puzzle {filewe}\", ROMX, BANK[5]\n");
                f.WriteLine($"SLP_{filewe}::\n");                
                f.WriteLine($"DB {2 * distinct}".PadRight(10, ' ') + " ; Tiles count\n");
                f.WriteLine($"SLP_{filewe}_Tiles::\n");
                f.WriteLine(tilesetStr + "\n");
                f.WriteLine($"SLP_{filewe}_TilesEnd::\n");
                f.WriteLine($"SLP_{filewe}_Tilemap::\n");
                f.WriteLine(tm.ToString() + "\n");
                f.WriteLine($"SLP_{filewe}_TilemapEnd::\n");               

            }
            Console.WriteLine("Done.");

            Console.ReadKey();
        }
    }

    class PxSquare
    {
        public int Dim;
        public byte[,] Pixels;
        public PxSquare(Bitmap bmp)
        {
            Dim = bmp.Width;
            Pixels = new byte[Dim, Dim];                    
            for (int y = 0; y < Dim; y++)
            {
                for (int x = 0; x < Dim; x++)
                {
                    var cl = bmp.GetPixel(x, y);
                    int value = 3 - ((cl.R + cl.G + cl.B) / 3) / 64;
                    if (value == 3) value = 0;
                    else if (value == 0) value = 3;
                    Pixels[y, x] = (byte)value;
                }
            }
        }
    }

    class Tile816
    {
        public byte[,] Pixels = new byte[16, 8];
        public byte[] Bytes = new byte[32];
        public int Id = -1;

        public Tile816(PxSquare psq, int row, int col)
        {
            row *= 16;
            col *= 8;
            for (int y = 0; y < 16; y++)
            {
                for (int x = 0; x < 8; x++)
                {
                    Pixels[y, x] = psq.Pixels[row + y, col + x];
                }
            }

            int k = 0;
            for (int y = 0; y < 16; y++)
            {
                byte b0 = 0, b1 = 0;
                for (int x = 0; x < 8; x++)
                {
                    b0 *= 2; b1 *= 2;
                    byte px = Pixels[y, x];
                    if (px == 1 || px == 3) b0++;
                    if (px == 2 || px == 3) b1++;
                }
                Bytes[k++] = b0;
                Bytes[k++] = b1;
            }
        }

        public bool Equals(Tile816 t816)
        {
            for(int i=0;i<32;i++)
            {
                if (Bytes[i] != t816.Bytes[i]) 
                    return false;
            }
            return true;
        }

        public override string ToString()
        {
            return "DB " + string.Join(", ", Bytes.Take(16).Select(b => "$" + b.ToString("x2").PadLeft(2, '0'))) + "\n" +
                   "DB " + string.Join(", ", Bytes.Skip(16).Select(b => "$" + b.ToString("x2").PadLeft(2, '0')));
        }
    }

    class Tilemap
    {
        public int Dim;
        public byte[,] Tiles;
        public Tilemap(int dim)
        {
            Dim = dim;
            Tiles = new byte[Dim, Dim];
        }

        public void SetTile(int r, int c, int id)
        {
            Tiles[r, c] = (byte)(2 * id);
            Tiles[r + 1, c] = (byte)(2 * id + 1);
        }

        public override string ToString()
        {
            string str = "";
            for (int y = 0; y < Dim; y++) 
            {
                str += "DB ";
                for (int x = 0; x < Dim; x++) 
                {
                    str += "$" + Tiles[y, x].ToString("x2").PadLeft(2, '0') + ", ";                    
                }
                str += "\n";                
            }
            return str;
        }
    }
}
