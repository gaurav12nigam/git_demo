from faker import Faker
import pandas as pd
exp = Faker()

exp = Faker()
data = [exp.profile() for i in range(10)]
df = pd.DataFrame(data)
print(df)

words = ['Hello','Abhishek','all', 'are','where','why',]
print(exp.sentence(ext_word_list=words))