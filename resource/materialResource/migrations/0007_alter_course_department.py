# Generated by Django 4.0.4 on 2022-06-01 18:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('materialResource', '0006_alter_course_pdf_alter_course_syllbus_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='course',
            name='department',
            field=models.CharField(choices=[('School of Mechanical Engineering', 'Mechanical Engineering'), ('School of Software Engineering', 'Software Engineering'), ('School of Civil Engineering', 'civil Engineering'), ('School of Biomedical Engineering', 'Biomedical Engineering'), ('School of Electrical Engineering', 'Electrical Engineering'), ('School of Chemical Engineering', 'Chemical Engineering')], default=None, max_length=255),
        ),
    ]
