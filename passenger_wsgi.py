import sys, os
INTERP = os.path.join('/var/www', 'Jormungandr', 'bin', 'python')
if sys.executable != INTERP:
    os.execl(INTERP, INTERP, *sys.argv)
sys.path.append(os.getcwd())

from Jormungandr.wsgi import application