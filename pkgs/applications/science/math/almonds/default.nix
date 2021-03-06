{ stdenv, python3, fetchFromGitHub, ncurses }:

with python3.pkgs; buildPythonApplication rec {
  pname = "almonds";
  version = "1.25b";

  src = fetchFromGitHub {
    owner = "Tenchi2xh";
    repo = "Almonds";
    rev = version;
    sha256 = "0j8d8jizivnfx8lpc4w6sbqj5hq35nfz0vdg7ld80sc5cs7jr3ws";
  };

  nativeBuildInputs = [ pytest ];
  buildInputs = [ ncurses ];
  propagatedBuildInputs = [ pillow ];

  checkPhase = "py.test";

  meta = with stdenv.lib; {
    description = "Terminal Mandelbrot fractal viewer";
    homepage = https://github.com/Tenchi2xh/Almonds;
    # No license has been specified
    license = licenses.unfree;
    maintainers = with maintainers; [ infinisil ];
  };
}
