
default:
	@echo
	@echo "To install dependencies, run 'make install'."
	@echo "To build reports and open, run 'make run'."
	@echo

run: clean process report open

clean:
	@echo "Cleaning..."
	@rm -f ./build/months/*.csv
	@rm -f ./build/summary/*.csv
	@rm -f ./build/db/*.db
	@rm -f ./out/*.csv
report:
	@echo "Building reports..."
	@bin/report.bash

process:
	@echo "Scrubbing data..."
	@bin/process.bash

open:
	@echo "Opening..."
	@gnome-open ./out/expenses.csv

install:
	@echo "INstalling pre-requisites..."
	@sudo apt-get install csvtool
	@sudo apt-get install sqlite3

