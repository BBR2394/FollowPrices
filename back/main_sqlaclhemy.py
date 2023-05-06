#! python3
#main de test pour sql alchemy
from sqlalchemy import create_engine
from sqlalchemy import select
import base_sqlalchemy
from sqlalchemy.orm import Session

engine = create_engine("postgresql://postgres:password@localhost:5432/sqlalchemy", echo=True)

session = Session(engine)

stmt = select(base_sqlalchemy.User).where(base_sqlalchemy.User.id == 0)
res = session.scalars(stmt).one()
print(res)
print(res.name)
print("FIN")