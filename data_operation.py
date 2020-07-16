#pycharm直接导入运行即可得到数据清洗后的数据

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.font_manager import _rebuild



data = pd.read_csv('./com(all).csv')
data = data.dropna(axis=1,how='all')    #将列方向全部项都是nan的row删除
data = data.drop('bianh',axis=1)
data['se_cat'].fillna('unknow',inplace=True)
data['com_des'].fillna('unknow',inplace=True)
data['total_money'].fillna('0',inplace=True)
data['death_reason'].fillna('unknow',inplace=True)
data['invest_name'].fillna('unknow',inplace=True)
data['ceo_name'].fillna('unknow',inplace=True)
data['ceo_des'].fillna('unknow',inplace=True)
data['ceo_per_des'].fillna('unknow',inplace=True)
#data['total_money'] = data['total_money'].astype(int)/10000
data.drop_duplicates(inplace=True)   #删除重复值，默认所有属性
data = data.reset_index()
data.index = data.index + 1
data.to_csv("d:/data.csv",header=1,index_label="id",index=False)

#计算 融资情况 的重复值 导出到CSV文件
df = data['financing'].value_counts()
df = df.reset_index()
df.index = df.index + 1
df.to_csv("d:/financing.csv",header=1,index_label="index",index=True)

financing_x = data['financing'].value_counts().index.tolist()
financing_y = data['financing'].value_counts().values.tolist()

#绘制 融资情况 图像 导出到png文件
plt.style.use('ggplot')
plt.rcParams['font.sans-serif'] =['SimHei']
plt.rcParams['axes.unicode_minus'] = False
fig = plt.figure(figsize=(12,6))
plt.xticks(rotation=-60)
plt.bar(financing_x,financing_y,align='center',color='c')
for a,b in zip(financing_x,financing_y):
    plt.text(a, b+0.05, '%.0f' %b, ha='center', va= 'bottom',fontsize=10)
plt.xlabel('融资情况')
plt.ylabel('公司数量')
fig.savefig('d:/financing.png', bbox_inches='tight')




#计算 地区 的重复值 导出到CSV文件
df = data['com_addr'].value_counts()
df = df.reset_index()
df.index = df.index + 1
df.to_csv("d:/com_addr.csv",header=1,index_label="id",index=True)

com_addr_x = data['com_addr'].value_counts().index.tolist()
com_addr_y = data['com_addr'].value_counts().values.tolist()
com_addr_x1 = [city_name.strip() for city_name in com_addr_x]
data['com_addr'].unique()  #addr中的唯一值


#绘制 公司区域数量 图像 导出到png文件
plt.style.use('ggplot')
plt.rcParams['font.sans-serif'] =['SimHei']
plt.rcParams['axes.unicode_minus'] = False
fig = plt.figure(figsize=(12,6))
plt.xticks(rotation=-60)
plt.bar(com_addr_x1,com_addr_y,align='center',color='c')
for a,b in zip(com_addr_x1,com_addr_y):
    plt.text(a, b+0.05, '%.0f' %b, ha='center', va= 'bottom',fontsize=10)
plt.xlabel('city')
plt.ylabel('公司数量')
fig.savefig('d:/com_addr.png', bbox_inches='tight')


#计算  领域  的重复值 导出到CSV文件
df = data['cat'].value_counts()
df = df.reset_index()
df.index = df.index + 1
df.to_csv("d:/cat.csv",header=1,index_label="id",index=True)

com_cat_x = data['cat'].value_counts().index.tolist()
com_cat_y = data['cat'].value_counts().values.tolist()
plt.style.use('ggplot')
plt.rcParams['font.sans-serif'] =['SimHei']
plt.rcParams['axes.unicode_minus'] = False
fig = plt.figure(figsize=(12,6))
plt.xticks(rotation=-60)
for a,b in zip(com_cat_x,com_cat_y):
    plt.text(a, b+0.1, '%.0f' % b, ha='center', va= 'bottom',fontsize=10)
plt.bar(com_cat_x,com_cat_y,align='center',color='c')
plt.xlabel('cat')
plt.ylabel('nums')
fig.savefig('d:/cat.png', bbox_inches='tight')

#计算  子领域  的重复值 导出到CSV文件
df = data['se_cat'].value_counts()
df = df.reset_index()
df.index = df.index + 1
df.to_csv("d:/se_cat.csv",header=1,index_label="id",index=True)

# 公司的2级行业分布
com_se_cat_x = data['se_cat'].value_counts().index.tolist()
com_se_cat_y = data['se_cat'].value_counts().values.tolist()
plt.style.use('ggplot')
fig = plt.figure(figsize=(12,6))
plt.xticks(rotation=-60)
plt.bar(com_se_cat_x[0:17],com_se_cat_y[0:17],align='center',color='c')
for a,b in zip(com_se_cat_x[0:17],com_se_cat_y[0:17]):
    plt.text(a, b+0.1, '%.0f' % b, ha='center', va= 'bottom',fontsize=10)
plt.xlabel('se_cat')
plt.ylabel('nums')
fig.savefig('d:/se_cat.png', bbox_inches='tight')


#计算  创建时间  的重复值 导出到CSV文件
df = data['born_data'].value_counts()
df = df.reset_index()
df.index = df.index + 1
df.to_csv("d:/born_data.csv",header=1,index_label="id",index=True)
# 创建时间
creat_time_year = [int(year[0:4]) for year in data['born_data']]
creat_time_month = [int(month[5:7]) for month in data['born_data']]
fig = plt.figure(figsize=(12,6))
x = creat_time_year
y = creat_time_month
size = (20*np.random.rand(6271))**2
colour = np.arctan2(x, y)
plt.scatter(x,y,s=size,c=colour)
plt.colorbar()
plt.xlabel('公司成立年份')
plt.ylabel('公司成立月份')
fig.savefig('d:/born.png', bbox_inches='tight')

#计算  死亡时间  的重复值 导出到CSV文件
df = data['death_data'].value_counts()
df = df.reset_index()
df.index = df.index + 1
df.to_csv("d:/born_data.csv",header=1,index_label="id",index=True)
# 死亡时间
creat_time_year = [int(year[0:4]) for year in data['death_data']]
creat_time_month = [int(month[5:7]) for month in data['death_data']]
fig = plt.figure(figsize=(12,6))
x = creat_time_year
y = creat_time_month
size = (20*np.random.rand(6271))**2
colour = np.arctan2(x, y)
plt.scatter(x,y,s=size,c=colour)
plt.colorbar()
plt.xlabel('公司死亡年份')
plt.ylabel('公司死亡月份')
fig.savefig('d:/death_data.png', bbox_inches='tight')


#计算  死亡原因  的重复值 导出到CSV文件
# 死亡原因
death_rs =[]
for death_r in data['death_reason']:
    if death_r != 'unknow':
        death_rs.extend(death_r.split(' '))
    else:
        continue
death_rs = pd.Series(data=death_rs)
df = death_rs.value_counts()
df = df.reset_index()
df.index = df.index + 1
df.to_csv("d:/death_rs.csv",header=1,index_label="id",index=True)

death_x = death_rs.value_counts().index.tolist()
death_y = death_rs.value_counts().values.tolist()
plt.style.use('ggplot')
fig = plt.figure(figsize=(12,6))
plt.xticks(rotation=-60)
plt.bar(death_x[0:15],death_y[0:15],align='center',color='c')
for a,b in zip(death_x[0:15],death_y[0:15]):
    plt.text(a, b+0.1, '%.0f' % b, ha='center', va= 'bottom',fontsize=10)
plt.xlabel('公司死亡原因')
plt.ylabel('数量')
fig.savefig('d:/death_rs.png', bbox_inches='tight')



#计算  投资机构  的重复值 导出到CSV文件
invests =[]
for invest in data['invest_name']:
    # print(invest)
    if invest !='unknow':
        invests.extend(invest.split('&'))
    else:
        continue
invests_num = pd.Series(data=invests)
df = invests_num.value_counts()
df = df.reset_index()
df.index = df.index + 1
df.to_csv("d:/invests_num.csv",header=1,index_label="id",index=True)

invest_x = invests_num.value_counts().index.tolist()
invest_y = invests_num.value_counts().values.tolist()
plt.style.use('ggplot')
fig = plt.figure(figsize=(12,6))
plt.xticks(rotation=-60)
plt.bar(invest_x[0:15],invest_y[0:15],align='center',color='c')
for a,b in zip(invest_x[0:15],invest_y[0:15]):
    plt.text(a, b+0.1, '%.0f' % b, ha='center', va= 'bottom',fontsize=10)
plt.xlabel('投资机构名称')
plt.ylabel('投资关闭公司数量')
fig.savefig('d:/invests_num.png', bbox_inches='tight')
