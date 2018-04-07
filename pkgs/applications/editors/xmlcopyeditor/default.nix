{ stdenv, fetchurl, pkgs, aspell, boost, expat, expect, intltool, libxml, libxslt, pcre, xercesc, wxwidgets }:

stdenv.mkDerivation rec {
  name = "xmlcopyeditor-${version}";
  version = "1.2.1.3";

  src = fetchurl {
    name = "${name}.tar.gz";
    url = "https://sourceforge.net/projects/xml-copy-editor/files/xmlcopyeditor-linux/${version}/${name}.tar.gz/download";
    sha256 = "0bwxn89600jbrkvlwyawgc0c0qqxpl453mbgcb9qbbxl8984ns4v";
  };

  buildInputs = [ aspell boost expat expect intltool libxml libxslt pcre xercesc wxwidgets ];

  CFLAGS="-I${pkgs.libxml2.dev}/include/libxml2/libxml";
  CPPFLAGS="-I${pkgs.libxml2.dev}/include/libxml2/libxml";

  preConfigure = ''
    export CFLAGS="-I${pkgs.libxml2.dev}/include/libxml2/libxml"
    export CPPFLAGS="-I${pkgs.libxml2.dev}/include/libxml2/libxml"
  '';

  meta = {
    description = "A fast, free, validating XML editor";
    homepage = http://xml-copy-editor.sourceforge.net/;
    license = stdenv.lib.licenses.gpl2Plus;
    platforms = stdenv.lib.platforms.linux;
  };
}
