
## Instalación de IPython notebook con kernel de Haskell

*Ubuntu*

 - Primero hay que instalar los paquetes dependencias (de python y haskell):
 
 ```bash
 $ sudo apt-get install python-dev haskell-platform
 ```

 - Luego hay que instalar el ipython notebook

 ```bash 
 $ pip install ipython[notebook]
 ```

 - Podemos verificar que la instalación fue exitosa corriendo el notebook:

 ```bash
 $ ipython notebook
 ```

 - Ahora hay que agregarle el kernel de Haskell.

  ```bash
  $ git clone https://github.com/gibiansky/IHaskell
  $ cd IHaskell
  # Es probable que falle, per lo corro igual para que instale todas las dependecias
  $ ./ubuntu-setup.sh
  $ export PATH=~/.cabal/bin:$PATH
  $ cabal install happy cpphs
  $ sudo apt-get install libncurses5-dev cpphs
  $ sudo ./build.sh ihaskell
  $ ihaskell install
  ```

 - Ahora se le puede agregar el plugin para las presentaciones.
 
 ```bash
 $ git clone https://github.com/damianavila/RISE
 $ cd RISE
 $ python setup.py install
```

 - Listo! Ahora podes correr el notebook con kernel de haskell:
 
 ```bash
 $ ipython notebook
 ```


## Tips

 *Insertar imágen*

 `![caption](images/sara.png)`


