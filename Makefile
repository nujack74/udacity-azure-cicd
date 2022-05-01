setup:
	python3 -m venv .venv

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt
        
test:
	python -m pytest -vv test_hello.py

lint:
	# pylint --disable=R,C hello.py
	pylint --disable=R,C,W1203,W0702 app.py

all: install lint test
