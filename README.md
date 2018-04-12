# Manchester_Encoding
Programming project for Data Communication class

## How to run
You need to install [Julia](https://julialang.org/) and UnicodePlots.jl package in your computer.

(e.g. `apt-get install julia` & `julia -e Pkg.add("UnicodePlots")`)

You can also use some sites to run Julia:

https://www.juliabox.com/

https://jupyter.nims.re.kr

Don't forget to install UnicodePlots.jl, too.

## After installing Julia
Go to the project folder and run `julia --color=yes manchester.jl`

If the program works successfully, it will tell you to type in
binary code, which you have to try again and again until the input
becomes binary code.

The result would be like the image below.

![Sample Image](/sample_image.png)

The code is currently written for cleaner image result in Jupyter notebook,
but you can always change `DotCanvas` in the code to `BrailleCanvas`
for better output in the command-line.
