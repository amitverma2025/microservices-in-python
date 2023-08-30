FROM python:3.11.5-alpine3.17
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY src src
EXPOSE 5000
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s \
            --retries=3 CMD curl -f http://localhost:9000/health || exit 1
ENTRYPOINT [ "python", "./src/app.py" ]