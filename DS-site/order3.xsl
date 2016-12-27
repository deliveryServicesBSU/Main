<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <link href="css/bootstrap.css" rel="stylesheet"/>
                <link href="css/table" rel="stylesheet"/>
                <script src="http://code.jquery.com/jquery-latest.js"/>
                <script src="js/bootstrap.js"/>
            </head>
            <body>
                <nav class="navbar navbar-default navbar-fixed-top">
                    <div class="container">
                        <div class="navbar-inverse">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"><span class="sr-only"></span><span class="icon-bar"></span><span class="icon-bar"></span></button><a class="navbar-brand" href="indexlogin.html">DService</a>
                        </div>
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav">
                                <li>
                                    <a href="indexlogin.html">Главная<span class="sr-only">(current)</span></a>
                                </li>
                                <li>
                                    <a href="#">Заказать доставку</a>
                                </li>
                            </ul>
                            <ul class="nav pull-right navbar-nav">
                                <li class="dropdown" id="fat-menu">
                                    <a class="dropdown-toggle" id="drop3" role="button" data-toggle="dropdown" href="#"><i class="icon-user icon-white"/>Nickname</a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="personal%20account.html">Личный кабинет</a>
                                        </li>
                                        <li>
                                            <a href="table.html"><i class="icon-trash"/>Мои заказы</a>
                                        </li>
                                        <li>
                                            <a href="settings.html"><i class="icon-ban-circle"/>Настройки</a>
                                        </li>
                                        <li class="divider"/>
                                        <li>
                                            <a href="index.html"><i class="i"/>Выход</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <div class="main"/>
                <div class="header">
                    <div class="texthead">
                        <p>Личный кабинет</p>
                    </div>
                    <div class="tab-acc ">
                        <ul class="nav nav-tabs">
                            <li>
                                <a href="personal%20account.html">Профиль</a>
                            </li>
                            <li class="active">
                                <a href="#">Заказы</a>
                            </li>
                            <li>
                                <a href="moneyStatus.html">Пополнить счёт</a>
                            </li>
                            <li>
                                <a href="orders1.html">Новый заказ </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <xsl:apply-templates select="//order"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="client">
        <h1>Номер заказа - <xsl:value-of select="@number"/></h1>
        <xsl:apply-templates select="//client[@number=current()/@number]" mode="client"/>
        <xsl:apply-templates select="*"/>
    </xsl:template>
    <xsl:template match="items">
        <xsl:apply-templates select="*" mode="items"/>
    </xsl:template>
    <xsl:template match="item" mode="items">
        <h3>Параметры посылки:</h3>
        <p>Вес посылки: <xsl:value-of select="@weight"/></p>
        <p>Размеры посылки: <xsl:value-of select="@size"/></p>
    </xsl:template>
        <xsl:template match="adreses">
            <h3>Параметры доставки:</h3>
            <table class="table table-bordered table-condensed">
                <thead>
                    <tr>
                        <td/>
                        <td>
                            Город
                        </td>
                        <td>
                            Улица
                        </td>
                        <td>
                            Дом
                        </td>
                        <td>
                            Квартира
                        </td>
                    </tr>
                </thead>
                <tbody>
                <tr>
                        <td>Откуда</td>
                        <p><xsl:apply-templates select="self::adreses[@id=current()/@id]" mode="sending"/></p>
                </tr>
                    <tr>
                            <td>Куда</td>
                            <p><xsl:apply-templates select="self::adreses[@id=current()/@id]" mode="delivery"/></p>
                    </tr>
                </tbody>
            </table>
        </xsl:template>
    <xsl:template match="sending" mode="sending">

        <td>
        <xsl:value-of select="@city"/>
        </td>
        <td>
        <xsl:value-of select="@street"/>
        </td>
        <td>
        <xsl:value-of select="@house"/>
        </td>
        <td>
        <xsl:value-of select="@flat"/>
        </td>

    </xsl:template>
    <xsl:template match="delivery" mode="delivery">

        <td>
            <xsl:value-of select="@city"/>
        </td>
        <td>
            <xsl:value-of select="@street"/>
        </td>
        <td>
            <xsl:value-of select="@house"/>
        </td>
        <td>
            <xsl:value-of select="@flat"/>
        </td>

    </xsl:template>

    <xsl:template match="contacts" mode="client">
                        <h4>Имя: <xsl:value-of select="@Name"/></h4>
                        <h4>Фамилия: <xsl:value-of select="@Surname"/></h4>
                        <h4>Контактный телефон: <xsl:value-of select="@Phone"/></h4>
    </xsl:template>
    <xsl:template match="date">
        <p/>
        <p>Дата: <xsl:value-of select="@value"/></p>
    </xsl:template>
    <xsl:template match="status">
        <p>Статус - <xsl:value-of select="@id"/></p>
        <hr/>
    </xsl:template>
</xsl:stylesheet>
