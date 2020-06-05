from common_func.models import Readnum
from django.contrib.contenttypes.fields import ContentType


def read_click(request, obj):
    ct = ContentType.objects.get_for_model(obj)  # 获得ct
    key = "%s_%s_read" % (ct.model, obj.id)
    if not request.COOKIES.get(key):
        if Readnum.objects.filter(content_type=ct, object_id=obj.id).count():    # 判断是否有数。没有为0假
            readnum = Readnum.objects.get(content_type=ct, object_id=obj.id)
        else:
            readnum = Readnum(content_type=ct, object_id=obj.id)    # 这里是实体。
        readnum.read_num += 1
        readnum.save()    # 保存的是实体不是实体内的属性。
    return key
