install.packages("devtools")
library(devtools)
install_github("dkahle/ggmap", ref = "tidyup")
# install_github("dkahle/ggmap", ref = "tidyup", force = T)     # ���� �ڵ�� ��ġ�� ������ �ȵ� ��� 
library("ggmap")

register_google(key = "")

names <- c("��ξ�", "���������", "��������",
           "�߹���������", "�Ѷ��1100����", "���͵�")

addr <- c("���ֽ� ��ξϱ� 15",
          "�������� ������ ���긮",
          "�������� ��ȫ��  299-3",
          "�������� �߹��� 2624-1",
          "�������� ���޵�  ��1-2",
          "���ֽ� �Ѱ�� ���긮 125")

gc <- geocode(enc2utf8(addr))
gc

df <- data.frame(name = names,
                 lon = gc$lon,
                 lat = gc$lat)


cen <- c(mean(df$lon), mean(df$lat))

map <- get_googlemap(center = cen,
                     maptype = "roadma",
                     zoom = 10,
                     size = c(480, 480),
                     markers = gc)

ggmap(map)