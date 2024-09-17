from fastapi import FastAPI, File, UploadFile
from fastapi.middleware.cors import CORSMiddleware
import uvicorn
import numpy as np
from io import BytesIO
from PIL import Image
import tensorflow as tf

app = FastAPI()

origins = [
    "http://localhost",
    "http://127.0.0.1",
    "http://127.0.0.1:86",
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"]
)


MODEL = tf.keras.models.load_model("models/1.keras")
CLASS_NAMES = ['Anthracnose',
'algal leaf','bird eye spot','brown blight','gray light','healthy','red leaf spot','white spot']

@app.get("/ping")
async def ping():
    return "hi"  


def read_file_as_image(data) -> np.array:
    image = np.array(Image.open(BytesIO(data)))
    return image


@app.post("/predict")
async def predict(
    file: UploadFile = File(...)
): 
    image = read_file_as_image(await file.read())
    img_batch = np.expand_dims(image,0)
    prediction = MODEL.predict(img_batch)
    predicted_class = CLASS_NAMES[np.argmax(prediction[0])]
    confidence = np.max(prediction[0])
    return {
        'class' : predicted_class,
        'code': predicted_class.replace(" ", "_").upper(), 
        'confidence' : float(confidence)
    }

if __name__ == "__main__":
    uvicorn.run(app, host='localhost', port=8001)
