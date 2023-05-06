#create the 29 January 2023

from fastapi import FastAPI
import sqlalchemy
#from sqlalchemy.orm import Mapped
#from sqlalchemy.orm import mapped_column
from pydantic import BaseModel
from sqlalchemy import create_engine
from sqlalchemy import select
import base_sqlalchemy


app = FastAPI()

# class ticket:
#     __tablename__ = "ticket"
#     id: Mapped[int] = mapped_column(primary_key=True)

# class company:
#     __tablename__ = "company"
#     id: Mapped[int] = mapped_column(primary_key=True)
#     name: Mapped[str]


class Item(BaseModel):
    name: str
    price: float
    #is_offer: Union[bool, None] = None

class Item(BaseModel):
    tck_date: str
    tck_id: int
    tck_id_shop: int


engine = create_engine("postgresql://postgres:password@localhost:5432/follow_prices", echo=True)

@app.get("/shell")
async def root():
    return {"message": "on va tester un truc demain"}

@app.get("/")
async def root():
    return {"message": "Hello World ! bonjour encore !"}

@app.get("/sqlalchemy/{item_id}")
def read_item(item_id: int, ): #q: Union[str, None] = None
    stmt = select(base_sqlalchemy.User).where(base_sqlalchemy.User.id == item_id)
    return stmt

@app.get("/items/{item_id}")
def read_item(item_id: int, ): #q: Union[str, None] = None
    return {"item_id": item_id, "q": "machin"}

if __name__ == '__main__':
    uvicorn.run(app, port=8080, host='0.0.0.0')