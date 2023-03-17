﻿#ifndef CHATCONTROLLER_H
#define CHATCONTROLLER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QJsonObject>
#include <QJsonDocument>
#include <QJsonArray>
#include <QByteArray>
#include "stdafx.h"

class ChatController : public QObject
{
    Q_OBJECT
    Q_PROPERTY_AUTO(bool,isLoading)
    Q_PROPERTY_AUTO(QString,responseData);
public:
    explicit ChatController(QObject *parent = nullptr);

    Q_INVOKABLE void sendMessage(const QString& text);

private:
    QNetworkAccessManager* networkManager;
};

#endif // CHATCONTROLLER_H