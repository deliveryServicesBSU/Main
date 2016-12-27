<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="order">
        <html>
          <head>
              <meta charset="utf-8"/>
              <link href="css/bootstrap.css" rel="stylesheet"/>
              <link href="css/table.css" rel="stylesheet"/>
              <script src="http://code.jquery.com/jquery-latest.js"></script>
              <script src="js/bootstrap.js"></script>
          </head>
            <body>
                  <nav class="navbar navbar-default navbar-fixed-top">
                      <div class="container">
                          <!-- Brand and toggle get grouped for better mobile display -->
                          <div class="navbar-inverse">
                              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                  <span class="sr-only"></span>
                                  <span class="icon-bar"></span>
                                  <span class="icon-bar"></span>
                              </button>
                              <a class="navbar-brand" href="indexlogin.html">DService</a>
                          </div>
                          <!-- Collect the nav links, forms, and other content for toggling -->
                          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                              <ul class="nav navbar-nav">
                                  <li><a href="indexlogin.html">Главная<span class="sr-only">(current)</span></a></li>
                                  <li><a href="#">Заказать доставку</a></li>
                              </ul>

                              <ul class="nav pull-right navbar-nav">
                                  <li class="dropdown" id="fat-menu">
                                      <a class="dropdown-toggle" id="drop3" role="button" data-toggle="dropdown" href="#"><i class="icon-user icon-white"></i> Nickname</a>
                                      <ul class="dropdown-menu">
                                          <li><a href="personal%20account.html">Личный кабинет</a></li>
                                          <li><a href="table.html"><i class="icon-trash"></i>Мои заказы</a></li>
                                          <li><a href="settings.html"><i class="icon-ban-circle"></i>Настройки</a></li>
                                          <li class="divider"></li>
                                          <li><a href="index.html"><i class="i"></i>Выход</a></li>
                                      </ul>
                                  </li>
                              </ul>
                          </div><!-- /.navbar-collapse -->
                      </div><!-- /.container-fluid -->
                  </nav>
<div class="main">
  <div class="header">
         <div class="texthead">
             <p>Личный кабинет</p>
         </div>

         <div class="tab-acc ">
             <ul class="nav nav-tabs">
                 <li><a href="personal%20account.html">Профиль</a></li>
                 <li class="active"><a href="#">Заказы</a></li>
                 <li><a href="moneyStatus.html">Пополнить счёт</a></li>
                 <li><a href="orders1.html">Новый заказ </a></li>
             </ul>
          </div>
</div>
</div>
                <xsl:apply-templates select="//client"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="client">
        <h1>Номер заказа - <xsl:value-of select="@number"/></h1>

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
                <td>
                  Подробнее
                </td>
            </tr>
        </thead>
      <tbody>
            <tr>
                <td>
                    <p>Откуда </p>
                    <p>Куда</p>
                </td>
                <td>

                        <p><xsl:value-of select="//sending/@city"/></p>
                        <p><xsl:value-of select="//delivery/@city"/></p>

                </td>
                <td>
                        <p><xsl:value-of select="//sending/@street"/></p>
                        <p><xsl:value-of select="//delivery/@street"/></p>
                </td>
                <td>
                        <p><xsl:value-of select="//sending/@house"/></p>
                        <p><xsl:value-of select="//delivery/@house"/></p>

                </td>
                <td>
                            <p><xsl:value-of select="//sending/@flat"/></p>
                            <p><xsl:value-of select="//delivery/@flat"/></p>


                </td>
                <td>

                    <p><a class="btn btn-sm btn-success butt"
                         href="#" data-toggle="modal"
                         data-target="#modal1">Подробнее</a>

                         </p>
                </td>
            </tr>
        </tbody>
    </table>
  </xsl:template>
  <xsl:template match="contacts">
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
