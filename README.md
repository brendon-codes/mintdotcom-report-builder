# Mint.com Report Builder

Requirements
------------

* Ubuntu 10.04
* Gnome


Setup
-----

    $ make install


Usage
-----

First, you will need to copy your Mint CSV exports into the
`in/months/` directory.

Then you can process and open them with:

    $ make run

The final output file will be located at `out/expenses.csv`.

