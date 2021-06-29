#!/usr/bin/fish
for v in 2.2 3.1 3.2
    if not test -d output/venv$v
        python3 -m venv output/venv$v
    end
    eval output/venv$v/bin/python3 -m pip install --upgrade Django~=$v
    if not test -d django$v
        mkdir output/django$v
    end
    eval output/venv$v/bin/python3 fish_django_completions.py --filename output/django$v/__fish_complete_django.fish
end
