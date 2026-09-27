# mousestrip (KWin script)
Kwin script that displays a read strip around the mouse.
The main purpose is to help focusing attention on the zone of the screen where the pointer is located. This is an aid for improving attention-related or color perception issues when working with a computer.

## Install

### With kpackagetool

Clone the repo and install the content of src/ with kpackagetool

* Plasma 5
```
cd /tmp
git clone https://github.com/lliurex/kwin-script-mousestrip
cd mousestrip
git checkout master_jammy
kpackagetool5 -i src/
````
* Plasma 6
```
cd /tmp
git clone https://github.com/lliurex/kwin-script-mousestrip
cd mousestrip
kpackagetool6 --type=KWin/Script -i src/
````

### Manually
```
cd /tmp
git clone https://github.com/lliurex/kwin-script-mousestrip
cd mousestrip
cp -r  src/ ~/.local/share/kwin/scripts/mousestrip
````


After enabled the visiblity of the strip is controlled with Ctrl+Meta+S (meta is also knowed as "win key").

For changes to be applied is mandatory - until implemented - to disable/enable the script.

## Configure

Configuration options are available at systemsettings->window management->kwin scripts.

![imatge](https://github.com/juanma1980/mousestrip/assets/15210634/c8e93ef0-ddc5-4ae2-bba3-fe98e3b7415a)


Available options:

* Strip height: Amount of lines for the strip, from 1 to 5. Each line is 48px.
* Strip color: Color for the strip. **Light colors could have a big decrease in readability**
* Strip opacity: Adjustable from 0 (transparent) to 50. **High values could decrease readability**
* Border height: Height of the border around the strip
* Border color: ...
* Border opacity: Adjustable from 0 (transparent) to 100 (opaque)
* Fill screen: If this option is enabled then the border will fill all the screen around the strip.

![imatge](https://github.com/juanma1980/mousestrip/assets/15210634/9b832ac2-08e8-40e8-bee2-fd24c4f9aea0)

## ToDo

* Apply changes
  
## Screenshots

Border height: 16 px. Border color: yellow. Strip color: red. Strip opacity: 30%
![imatge](https://github.com/juanma1980/mousestrip/assets/15210634/5cf118dd-b68a-47ae-9ad0-c70efd647b09)


Border height: Fill. Border color: black. Border opacity: 50%. Strip color: black. Strip opacity: 15%
![imatge](https://github.com/juanma1980/mousestrip/assets/15210634/15ed19c6-890f-4120-96a7-25355b88339d)

