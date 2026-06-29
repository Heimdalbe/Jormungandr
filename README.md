## Production

1. Maak een nieuwe .env file volgens de template
    1.1 Als je een externe database gebruikt, pas de docker compose en .env gepast aan
    1.2 Als je de db via docker compose gebruikt init deze met een sql file, als je een externe database gebruikt, gebruik pg_restore om de data in de database te krijgen.
2. Gebruik nginx om alle traffic aan te nemen en vervolgens door te sturen naar poort 9500
3. Build de Dockerfile --> `docker build . -t jormungandr-web`
4. Run de docker-compose file --> `docker compose up`



