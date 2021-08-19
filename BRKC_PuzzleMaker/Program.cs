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
 * -            OR a 4x4 sliding puzzle with pieces of size 3x3 tiles (24x24 px)
 * -            OR a 6x6 sliding puzzle with pieces of size 2x2 tiles (16x16 px)
 * -   80x80 px => a 5x5 sliding puzzle with pieces of size 2x2 tiles (16x16 px)
 * 
 * (A)RGB color is converted to Gameboy color in the following way:
 * 
 *                Gameboy Palette Index = 3 - ((R+G+B)/3)/64,
 *                then swap indices 0 and 3.          
 * 
 * Requirements/Limitations:
 * 
 *  - final maximum number of tiles is 226. (Though this is always the case)
 *  - input image must be of size 80x80 or 96x96 px.
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

            if (w != 96 && w != 80) 
                throw new ArgumentException("Image must be 96x96, 128x128 or 80x80 pixels.");

            if (w == 96)
            {
                sptype = 3;
            }           
            else if (w == 80)
            {
                sptype = 5;
            }

            Console.WriteLine($"Image size : ({w}px, {h}px)");

            PxSquare psq = new PxSquare(bmp);

            List<Tile> Tiles = new List<Tile>();

            for (int r = 0; 8 * r < h; r++)             
                for (int c = 0; 8 * c < w; c++)                                     
                    Tiles.Add(new Tile(psq, r, c));

            for (; Tiles.Count < 144; Tiles.Add(new Tile())) ;                        

            string tilesetStr = "";
            for (int i = 0; i < Tiles.Count; i++)
                tilesetStr += Tiles[i].ToString() + "\n";

            int totalSize = 16 * Tiles.Count;
            Console.WriteLine($"Total sliding puzzle size: 0x{totalSize.ToString("X2")} bytes.");

            var filewe = Path.GetFileNameWithoutExtension(fn);
            var dir = Path.GetDirectoryName(fn);
            Console.WriteLine("Writing to file...");

            string ptype = (w == 96) ? "3x3 or 4x4 or 6x6" : "5x5";
            using (var f = new StreamWriter(File.Create(Path.Combine(dir, filewe + ".asm"))))
            {
                f.WriteLine($"; This file was generated automatically by BRKC_PuzzleMaker at {DateTime.Now}.");
                f.WriteLine($"; This is a sliding puzzle and must be registered in the puzzles list of BRKC.");
                f.WriteLine($"; Possible puzzle types: {ptype}.");
                f.WriteLine();
                f.WriteLine("INCLUDE \"include/charmap.puzzle.inc\"");
                f.WriteLine();
                f.WriteLine("; SRAM Highscore");
                f.WriteLine();
                f.WriteLine($"SECTION \"SLP_{filewe} HighScore\", SRAM\n");
                f.WriteLine($"SLP_{filewe}_HighScore::");
                f.WriteLine($"  DS 3\n");

                f.WriteLine($"SECTION \"Sliding Puzzle {filewe}\", ROMX, BANK[5], ALIGN[8]\n");
                f.WriteLine($"SLP_{filewe}_Tiles::\n");
                f.WriteLine(tilesetStr + "\n");

                f.WriteLine($"SLP_{filewe}_Text::");

                string str = "0000000000000000";
                while (str.Length > 14) 
                {
                    Console.Write("Puzzle name (max. 14 characters):");
                    str = Console.ReadLine();
                }
                if (str.Length % 2 == 1)
                    str += " ";
                int padlen = (14 - str.Length) / 2;
                
                str = str.PadLeft(14 - padlen, ' ').PadRight(14, ' ');
                f.WriteLine($"DB \"{str}\"");
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

    class Tile
    {
        public byte[,] Pixels = new byte[8, 8];
        public byte[] Bytes = new byte[16];        

        public Tile()
        {
            for(int i=0;i<8;i++)
            {
                for(int j=0;j<8;j++)
                {
                    Pixels[i, j] = 0;                    
                }
            }
            for (int i = 0; i < 15; i++)
                Bytes[i] = 0;
        }
        public Tile(PxSquare psq, int row, int col)
        {
            row *= 8;
            col *= 8;
            for (int y = 0; y < 8; y++)
            {
                for (int x = 0; x < 8; x++)
                {
                    Pixels[y, x] = psq.Pixels[row + y, col + x];
                }
            }

            int k = 0;
            for (int y = 0; y < 8; y++) 
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

        public bool Equals(Tile t816)
        {
            for (int i = 0; i < 16; i++) 
            {
                if (Bytes[i] != t816.Bytes[i]) 
                    return false;
            }
            return true;
        }

        public override string ToString()
        {
            return "DB " + string.Join(", ", Bytes.Select(b => "$" + b.ToString("x2").PadLeft(2, '0')));
        }
    }    
}
