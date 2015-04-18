
## Instalación de IPython notebook con kernel de Haskell

*Ubuntu*

 - Primero hay que instalar los paquetes dependencias (de python y haskell):

  sudo apt-get install python-dev haskell-platform

 - Luego hay que instalar el ipython notebook

  pip install ipython[notebook]

 - Podemos verificar que la instalación fue exitosa corriendo el notebook:

  ipython notebook

 - Ahora hay que agregarle el kernel de Haskell.

  git clone https://github.com/gibiansky/IHaskell
  cd IHaskell
  # Es probable que falle, per lo cooro igual Para que instale todas las dependecias
  ./ubuntu-setup.sh
  export PATH=~/.cabal/bin:$PATH
  cabal install happy cpphs
  sudo apt-get install libncurses5-dev cpphs
  sudo ./build.sh ihaskell
  ihaskell install
  
 - Ahora se le puede agregar el plugin para las presentaciones.

  git clone https://github.com/damianavila/RISE
  cd RISE
  python setup.py install

 - Listo! Ahora podes correr el notebook con kernel de haskell:

  ipython notebook

    

  

