<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <body>
                <h1>Номер заказа - <xsl:value-of select="//client/@number"/></h1>
                <xsl:apply-templates select="//client"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="contacts">
        <h2>Имя: <xsl:value-of select="@Name"/></h2>
        <h2>Фамилия: <xsl:value-of select="@Surname"/></h2>
        <h2>Контактный телефон: <xsl:value-of select="@Phone"/></h2>
    </xsl:template>
    <xsl:template match="items">
        <p>Вес посылки: <xsl:value-of select="//item/@weight"/></p>
        <p>Размеры посылки: <xsl:value-of select="//item/@size"/></p>
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
                    <p>Страна </p>
                    <p>Город </p>
                    <p>Улица </p>
                    <p>Дом </p>
                </td>
                <td>
                        <p><xsl:value-of select="//sending/@country"/></p>
                        <p><xsl:value-of select="//sending/@city"/></p>
                        <p><xsl:value-of select="//sending/@street"/></p>
                        <p><xsl:value-of select="//sending/@house"/></p>
                </td>
                <td>
                        <p><xsl:value-of select="//delivery/@country"/></p>
                        <p><xsl:value-of select="//delivery/@city"/></p>
                        <p><xsl:value-of select="//delivery/@street"/></p>
                        <p><xsl:value-of select="//delivery/@house"/></p>
                </td>
            </tr>
        </tbody>
    </table>
    </xsl:template>
    <xsl:template match="date">
        <p><xsl:value-of select="@value"/></p>
    </xsl:template>
    <xsl:template match="status">
        <p>Статус - <xsl:value-of select="@id"/></p>
    </xsl:template>
</xsl:stylesheet>