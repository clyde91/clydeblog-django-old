from django.db import models
from django.contrib.contenttypes.fields import GenericForeignKey
from django.contrib.contenttypes.fields import ContentType


# Create your models here.


class Readnum(models.Model):
    read_num = models.IntegerField(default=0, verbose_name="阅读次数")

    content_type = models.ForeignKey(ContentType, on_delete=models.DO_NOTHING)
    object_id = models.PositiveIntegerField()
    content_object = GenericForeignKey('content_type', "object_id")    # 跨APP的类，获取实例
    # article = models.OneToOneField(Article, on_delete=models.DO_NOTHING)

    # def __str__(self):
    #     return '%s' % self.read_num


class ReadnumMethod():
    def get_read_num(self):
        ct = ContentType.objects.get_for_model(self)    # 获得ct
        try:
            readnum = Readnum.objects.get(content_type=ct, object_id=self.id)  # 获得该文章的阅读数。通过关联模型，id
            return readnum.read_num
        except Exception as e:
            return 0

