{ lib, stdenv, fetchFromGitHub, autoreconfHook }: stdenv.mkDerivation rec {
  pname = "libtexprintf";
  version = "1.27";

  src = fetchFromGitHub {
    owner = "bartp5";
    repo = "libtexprintf";
    rev = "v${version}";
    sha256 = "sha256-5C3VZWxbxNHxQcQdeeHh/etwIqfqUed9kHvRf2TVilE=";
  };

  nativeBuildInputs = [ autoreconfHook ];

  meta = with lib; {
    description = "Library and tools for formatted output with TeX‑like syntax (utftex)";
    homepage = "https://github.com/bartp5/libtexprintf";
    license = licenses.gpl3Only;
    mainProgram = "utftex";
  };
}
