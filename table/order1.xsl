<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <link href="css/bootstrap.css" rel="stylesheet"/>
                <link href="css/styles.css" rel="stylesheet"/>
                <script src="http://code.jquery.com/jquery-latest.js"/>
                <script src="js/bootstrap.js"/>
            </head>
            <body>
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
        <table>
            <thead>
                <tr>
                    <td/>
                    <td>
                        Sending
                    </td>
                    <td>
                        Delivery
                    </td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <p>Город </p>
                        <p>Улица </p>
                        <p>Дом </p>
                        <p>Квартира </p>
                    </td>
                    <td>
                        <xsl:apply-templates select="//adreses[@id=current()/@id]" mode="sending"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="//adreses[@id=current()/@id]" mode="delivery"/>
                    </td>
                </tr>
            </tbody>
        </table>
    </xsl:template>
    <xsl:template match="sending" mode="sending">
        <p><xsl:value-of select="@city"/></p>
        <p><xsl:value-of select="@street"/></p>
        <p><xsl:value-of select="@house"/></p>
        <p><xsl:value-of select="@flat"/></p>
    </xsl:template>
    <xsl:template match="delivery" mode="delivery">
        <p><xsl:value-of select="@city"/></p>
        <p><xsl:value-of select="@street"/></p>
        <p><xsl:value-of select="@house"/></p>
        <p><xsl:value-of select="@flat"/></p>
    </xsl:template>
    <xsl:template match="contacts" mode="client">
        <div class="modal fade" id="modal1" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header"><button class="close" type="button" data-dismiss="modal">x</button>
                        Подробнее
                    </div>
                    <div class="modal-body">
                        <h4>Имя: <xsl:value-of select="@Name"/></h4>
                        <h4>Фамилия: <xsl:value-of select="@Surname"/></h4>
                        <h4>Контактный телефон: <xsl:value-of select="@Phone"/></h4>
                    </div>
                    <div class="modal-footer"><button class="btn btn-default" type="button" data-dismiss="modal">Закрыть</button>
                    </div>
                </div>
            </div>
        </div>
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
