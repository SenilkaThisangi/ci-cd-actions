from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
def health():
  return {"status":"ok", "service":"j4-platform"}


@app.get("/")

def root():
  return { "message": "J4 Platform service running"}
  
