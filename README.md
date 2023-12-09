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

1. Install Python 3.9 and ensure it's added to your system's PATH variable. You can download Python 3.9 [here](https://www.python.org/downloads/release/python-3913/).

2. Check if Python version is 3.9:

    ```sh
    python -V
    ```

3. Clone the repository:

    ```sh
    git clone https://github.com/Heimdalbe/Jormungandr.git
    ```

4. Navigate to the project directory:

    ```sh
    cd Jormungandr
    ```

5. Create a virtual environment named `venv` in the current directory:

    ```sh
    python -m venv venv
    ```

6. Activate the virtual environment:

   - For Windows:

        ```shell
        .\venv\Scripts\activate
        ```

   - For Linux:

        ```sh
        source ./venv/bin/activate
        ```

7. Install the necessary Python libraries:

    ```sh
    pip install -r requirements.txt
    ```

8. Optional: Test if the libraries are installed:

    ```sh
    pip list
    ```

9. Create `secrets.py`:

    ```sh
    cp ./Jormungandr/settings/sample.secrets ./Jormungandr/settings/secrets.py
    ```

10. Modify the database connection code in `secrets.py`:

    ```python
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.sqlite3',
            'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
        }
    }
    ```

    ![database_url change example](https://i.imgur.com/b5bkb3v.png)

11. Create a `.env` file:

    - Powershell:

        ```shell
        echo "SECRET_KEY=1234
        DEBUG=true
        ALLOWED_HOSTS=.localhost 127.0.0.1 [::1]
        DATABASE_URL=sqlite:///$(pwd)/db.sqlite3
        CSRF_TRUSTED_ORIGINS="| Out-File -FilePath .env -Encoding ascii
        ```

    - Bash:

        ```sh
        echo "SECRET_KEY=1234
        DEBUG=true
        ALLOWED_HOSTS=.localhost 127.0.0.1 [::1]
        DATABASE_URL=sqlite:///$(pwd)/db.sqlite3
        CSRF_TRUSTED_ORIGINS=" > .env
        ```

12. Run the migration commands:

    ```sh
    python manage.py makemigrations
    python manage.py makemigrations Backend
    python manage.py migrate
    ```

13. Create a superuser:

    ```sh
    python manage.py createsuperuser
    ```

14. Run the server:

    ```sh
    python manage.py runserver
    ```
