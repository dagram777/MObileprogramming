# Generated by Django 4.0.4 on 2022-06-03 16:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('materialResource', '0011_remove_course_user_remove_feedback_users_student_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='student',
            name='email',
            field=models.EmailField(default=1, max_length=255),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='student',
            name='user_name',
            field=models.CharField(default=1, max_length=255),
            preserve_default=False,
        ),
    ]
