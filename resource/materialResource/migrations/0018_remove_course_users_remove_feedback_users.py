# Generated by Django 4.0.5 on 2022-06-04 15:30

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('materialResource', '0017_alter_course_users_alter_feedback_users'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='course',
            name='users',
        ),
        migrations.RemoveField(
            model_name='feedback',
            name='users',
        ),
    ]