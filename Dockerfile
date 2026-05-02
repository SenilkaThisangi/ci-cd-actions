FROM python:3.11-slim

LABEL maintain="Group J$ - Platform and Security
LABEL description="J4 platform health-check and ops service"

ENV PYTHONDONUNBUFFERED=1

RUN addgroup --system apprgoup && adduser --system --ingroup appgroup appuser

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cachw-dir -r requirements.txt

COPY . .

USER appuser

EXPOSE 8000

HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
  CMD python -c "import urlib.request; urlib.request.urlopen('http://localhost:8000/health')"

CMD ["python, "-m","uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
