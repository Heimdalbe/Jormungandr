## Install in production

Jormungandr is served with nginx and passenger.
We use a postgresql database, already installed on the server.

```
virtualenv Jormungandr
cd Jormungandr
source bin/activate
pip install Django //and other requirements
git clone git@gitlab.com:heimdal-gent/jormungandr.git
sudo su - postgres
psql -d template1
CREATE USER jormungandr WITH PASSWORD '********';
CREATE DATABASE jormungandr --encoding='utf-8';
GRANT ALL PRIVILEGES ON DATABASE jormungandr to jormungandr;
\q
exit

```

## Install in local

```
virtualenv Jormungandr
cd Jormungandr
source bin/activate
pip install Django //and other requirements OF pip install -r requirements.txt
git clone git@gitlab.com:heimdal-gent/jormungandr.git
```

```
Make secrets.py based on sample.secrets
Database code:
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
which will make a new sqlite instance, dont use this in production
```

```
python manage.py makemigrations
python manage.py makemigrations Backend
python manage.py migrate
python manage.py runserver
python manage.py createsuperuser

```
