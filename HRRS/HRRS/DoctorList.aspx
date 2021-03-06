<%@ Page Title="医生" Language="C#" MasterPageFile="~/MasterSite.Master" AutoEventWireup="true" CodeBehind="DoctorList.aspx.cs" Inherits="HRRS.DoctorList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .nav > .li-item:nth-child(3) {
            background-color: #E7E7E7;
        }

        .nav > .li-item {
            background-color: #f8f8f8;
        }

        .hospital-list {
            box-shadow: 0 0 20px #ccc;
            border-radius: 20px;
            margin-bottom: 20px
        }

        .title {
            border-bottom: 1px solid #ccc;
            margin-bottom: 20px;
            padding: 8px 5px;
        }

            .title > i {
                position: relative;
                top: 4px
            }

        .btnGroup {
            text-align: center;
        }

        .title {
            margin-bottom: 10px
        }

        #order-box {
            border: 1px solid #ddd;
            margin-bottom: 10px;
            border-radius: 4px
        }

        #order {
            display: flex;
            justify-content: space-around;
        }

            #order > .form-group-box {
                display: flex;
                margin-top: 10px
            }

        .form-group-label {
            margin-top: 7px;
            margin-right: 5px
        }

        .form-group {
            margin-bottom: 10px
        }

        .form-select {
            width: 210px;
            text-align: center;
        }

        .thumbnail {
            transition: all 0.3s
        }

            .thumbnail:hover {
                box-shadow: 0 0 20px #ccc;
                transform: translateY(-6px)
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row clearfix">
        <div class="col-md-10 col-md-offset-1 hospital-list">
            <h3 class="title">
                <i>
                    <%-- 我很长，你忍一下··· --%>
                    <svg t="1646137565596" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="6675" width="20" height="20">
                        <path d="M546.304 692.736H158.208c-20.992 0-37.888-16.896-37.888-37.888v-2.56c0-20.992 16.896-37.888 37.888-37.888h388.096c20.992 0 37.888 16.896 37.888 37.888v2.56c0 20.992-16.896 37.888-37.888 37.888z" fill="#E3EEFF" p-id="6676"></path>
                        <path d="M546.304 832h-5.632c-38.4 0-69.632-31.232-69.632-69.632s31.232-69.632 69.632-69.632h5.632V614.4H185.344v78.336h131.584c38.4 0 69.632 31.232 69.632 69.632s-31.232 69.632-69.632 69.632H185.344v78.336h360.96v-78.336z" fill="#E3EEFF" p-id="6677"></path>
                        <path d="M568.32 495.616c0-14.336-11.264-25.6-25.6-26.112H284.16c-14.336 0-26.112 11.776-26.112 26.112s11.776 26.112 26.112 26.112H389.632c25.6 0 46.592 20.992 46.592 46.592s-20.992 46.592-46.592 46.592H301.568v52.224H542.72v-52.224h-3.584c-25.6 0-46.592-20.992-46.592-46.592s20.992-46.592 46.592-46.592h4.096c13.824-0.512 25.088-11.776 25.088-26.112zM712.704 832H159.232c-21.504 0-39.424 17.408-39.424 39.424 0 21.504 17.408 39.424 39.424 39.424h553.472v-78.848zM727.04 832h33.28v78.336H727.04zM800.256 832h21.504v78.336h-21.504zM882.176 832h-49.664v78.336h49.664c21.504 0 39.424-17.408 39.424-39.424 0-21.504-17.408-38.912-39.424-38.912z" fill="#E3EEFF" p-id="6678"></path>
                        <path d="M400.384 449.024h152.064s11.776 33.28 30.72 55.296c18.432-34.304 28.672-79.36 28.672-128.512 0-3.072-0.512-7.168-0.512-10.752-39.936-18.432-76.288-30.208-126.464-30.208-50.688 0-93.184 5.12-134.144 24.064 0 3.072-2.048 14.848-2.048 17.408 0 44.544 9.728 85.504 26.112 118.272 13.824-12.288 28.672-30.208 25.6-45.568z" fill="#FFEFE9" p-id="6679"></path>
                        <path d="M584.704 515.584l-6.144-7.168c-15.872-18.432-26.624-43.52-30.208-53.248H407.04c-1.024 13.312-10.24 28.16-27.648 44.544L373.76 505.344l-3.584-7.68c-17.408-34.816-27.136-76.8-27.136-121.344 0-2.048 0.512-5.12 1.024-10.24 0.512-3.072 1.024-6.144 1.024-7.168v-3.584l3.584-1.536c36.864-17.408 77.824-24.576 136.704-24.576 51.712 0 88.576 12.288 129.024 30.72l3.584 1.536v7.68c0 2.048 0.512 4.608 0.512 6.656 0 49.664-10.24 95.232-29.184 131.584l-4.608 8.192zM393.216 442.88h163.84l1.536 4.096c0 0.512 9.216 25.6 24.064 46.08 15.36-32.768 23.552-73.216 23.552-117.248 0-1.536 0-3.584-0.512-5.632v-0.512c-37.376-16.896-72.192-28.16-120.32-28.16-55.296 0-93.696 6.656-128 22.016 0 1.536-0.512 3.072-0.512 4.608-0.512 3.072-1.024 7.68-1.024 8.704 0 39.424 7.68 76.288 22.016 107.52 12.8-13.824 18.944-25.6 17.408-34.816l-2.048-6.656zM208.384 521.728h-38.4c-2.56 0-4.608-2.048-4.608-4.608s2.048-4.608 4.608-4.608h38.4c2.56 0 4.608 2.048 4.608 4.608s-2.048 4.608-4.608 4.608z" fill="#2B77EF" p-id="6680"></path>
                        <path d="M188.928 541.184c-2.56 0-4.608-2.048-4.608-4.608v-38.4c0-2.56 2.048-4.608 4.608-4.608s4.608 2.048 4.608 4.608v38.4c0 2.56-2.048 4.608-4.608 4.608z" fill="#2B77EF" p-id="6681"></path><path d="M488.448 279.04c-18.944 0-34.816-14.336-36.864-33.792-1.536-20.48 13.312-38.4 33.792-39.936 20.48-1.536 38.4 13.312 39.936 33.792 1.024 9.728-2.048 19.456-8.704 27.136-6.144 7.68-15.36 12.288-25.088 12.8h-3.072z m0-64.512h-2.56c-15.36 1.536-26.624 14.848-25.088 30.208 1.536 15.36 14.848 26.624 30.208 25.088 7.168-0.512 13.824-4.096 18.944-9.728 4.608-5.632 7.168-12.8 6.144-19.968-1.024-14.848-13.312-25.6-27.648-25.6z" fill="#82A0F6" p-id="6682"></path>
                        <path d="M821.76 664.576c-2.56 0-4.608-2.048-4.608-4.608v-28.16l-19.968 19.968c-2.048 2.048-4.608 2.048-6.656 0s-2.048-4.608 0-6.656l19.968-19.968h-28.16c-2.56 0-4.608-2.048-4.608-4.608s2.048-4.608 4.608-4.608h28.16l-19.968-19.968c-2.048-2.048-2.048-4.608 0-6.656s4.608-2.048 6.656 0l19.968 19.968v-28.16c0-2.56 2.048-4.608 4.608-4.608s4.608 2.048 4.608 4.608v28.16l19.968-19.968c2.048-2.048 4.608-2.048 6.656 0s2.048 4.608 0 6.656l-19.968 19.968h28.16c2.56 0 4.608 2.048 4.608 4.608s-2.048 4.608-4.608 4.608h-28.16l19.968 19.968c2.048 2.048 2.048 4.608 0 6.656s-4.608 2.048-6.656 0l-19.968-19.968v28.16c0 2.56-2.048 4.608-4.608 4.608z" fill="#82A0F6" p-id="6683"></path>
                        <path d="M145.92 461.824c-2.56 0-4.608-2.048-4.608-4.608v-28.16l-19.968 19.968c-2.048 2.048-4.608 2.048-6.656 0s-2.048-4.608 0-6.656l19.968-19.968h-28.16c-2.56 0-4.608-2.048-4.608-4.608s2.048-4.608 4.608-4.608h28.16l-19.968-19.968c-2.048-2.048-2.048-4.608 0-6.656s4.608-2.048 6.656 0l19.968 19.968V378.88c0-2.56 2.048-4.608 4.608-4.608s4.608 2.048 4.608 4.608v28.16l19.968-19.968c2.048-2.048 4.608-2.048 6.656 0s2.048 4.608 0 6.656l-19.968 19.968h28.16c2.56 0 4.608 2.048 4.608 4.608s-2.048 4.608-4.608 4.608h-28.16l19.968 19.968c2.048 2.048 2.048 4.608 0 6.656s-4.608 2.048-6.656 0l-19.968-19.968v28.16c0 2.048-2.048 4.096-4.608 4.096z" fill="#82A0F6" p-id="6684"></path>
                        <path d="M745.984 279.04h-38.4c-2.56 0-4.608-2.048-4.608-4.608s2.048-4.608 4.608-4.608h38.4c2.56 0 4.608 2.048 4.608 4.608s-2.048 4.608-4.608 4.608z" fill="#2B77EF" p-id="6685"></path>
                        <path d="M727.04 297.984c-2.56 0-4.608-2.048-4.608-4.608v-38.4c0-2.56 2.048-4.608 4.608-4.608s4.608 2.048 4.608 4.608v38.4c0 2.56-2.048 4.608-4.608 4.608z" fill="#2B77EF" p-id="6686"></path>
                        <path d="M208.384 193.536c0 18.432-12.8 33.792-28.16 33.792 15.36 0 28.16 14.848 28.16 33.792 0-18.432 12.8-33.792 28.16-33.792-15.36 0-28.16-14.848-28.16-33.792z" fill="#76A6EF" p-id="6687"></path>
                        <path d="M145.92 772.608c-11.264 0-20.992-9.216-20.992-20.992 0-11.264 9.216-20.992 20.992-20.992s20.992 9.216 20.992 20.992c-0.512 11.776-9.728 20.992-20.992 20.992z m0-32.256c-6.144 0-11.776 5.12-11.776 11.776 0 6.144 5.12 11.776 11.776 11.776 6.144 0 11.776-5.12 11.776-11.776-0.512-6.656-5.632-11.776-11.776-11.776zM799.744 745.472c-11.264 0-20.992-9.216-20.992-20.992s9.216-20.992 20.992-20.992c11.264 0 20.992 9.216 20.992 20.992s-9.216 20.992-20.992 20.992z m0-32.256c-6.144 0-11.776 5.12-11.776 11.776 0 6.144 5.12 11.776 11.776 11.776 6.144 0 11.776-5.12 11.776-11.776 0-6.656-5.12-11.776-11.776-11.776z" fill="#82A0F6" p-id="6688"></path>
                        <path d="M780.288 328.192c-2.56 37.376 20.992 69.632 52.736 71.68-31.744-2.048-58.88 26.624-61.44 64 2.56-37.376-20.992-69.632-52.736-71.68 31.232 2.048 58.88-26.624 61.44-64zM663.552 516.096c0 22.528-15.36 40.96-34.304 40.96 18.944 0 34.304 18.432 34.304 40.96 0-22.528 15.36-40.96 34.304-40.96-18.944 0-34.304-18.432-34.304-40.96z" fill="#76A6EF" p-id="6689"></path>
                        <path d="M427.52 478.72h108.544v261.632H427.52z" fill="#FFEFE9" p-id="6690"></path>
                        <path d="M542.208 746.496H421.376V472.576h120.832v273.92z m-108.544-12.288h96.256V484.864H433.664v249.344z" fill="#408CFF" p-id="6691"></path>
                        <path d="M512 573.44l22.016-10.752c0.512 0 1.024 0 1.024 0.512l-3.584 32.256-35.328 75.264c-0.512 0.512-1.536 0.512-1.536-0.512l16.384-64v-32.256c0.512-0.512 0.512-0.512 1.024-0.512z" fill="#FFD8C9" p-id="6692"></path>
                        <path d="M237.568 724.992c6.656-18.944 16.384-37.376 29.696-52.736 53.76-62.464 160.256-82.432 160.256-82.432L479.744 706.56l56.32-116.736s107.52 19.968 169.472 81.408c60.928 60.416 49.664 189.44 49.664 189.44H222.72s-4.096-37.888 2.048-83.456" fill="#C7DDFF" p-id="6693"></path>
                        <path d="M714.24 671.232c-61.952-61.44-169.472-81.408-169.472-81.408l-8.704 18.432c34.304 12.8 75.776 32.768 105.984 62.976 60.928 60.416 49.664 189.44 49.664 189.44h72.192c0-0.512 11.264-129.024-49.664-189.44z" fill="#76A6EF" p-id="6694"></path>
                        <path d="M522.24 708.608l50.688-105.984c-24.576-7.68-41.984-11.264-41.984-11.264l-52.736 116.736h44.032z" fill="#76A6EF" p-id="6695"></path>
                        <path d="M272.384 777.216l12.8-52.224c6.656-18.944 16.384-37.376 29.696-52.736 31.744-36.864 82.432-59.392 118.272-71.168l-5.12-11.264s-106.496 19.968-160.256 82.432c-13.312 15.36-23.04 33.792-29.696 52.736L225.28 777.216c-6.656 45.568-2.048 83.456-2.048 83.456h47.104c-0.512-0.512-4.608-38.4 2.048-83.456z" fill="#FFFFFF" p-id="6696"></path>
                        <path d="M755.2 868.864h-532.48c-4.096 0-7.68-3.072-8.192-7.68 0-1.536-4.608-39.424 2.048-85.504 0.512-4.608 5.12-7.68 9.728-7.168 4.608 0.512 7.68 5.12 7.168 9.728-4.608 32.256-3.584 60.416-2.56 73.728H747.52c1.024-28.16 1.536-125.952-47.616-174.592-51.2-50.688-135.168-72.704-158.72-77.824l-53.248 110.592c-1.536 3.072-4.608 4.608-7.68 4.608s-6.144-2.048-7.68-5.12L422.4 599.04c-23.552 5.632-105.472 27.648-148.992 78.336-11.776 13.312-20.992 30.208-28.16 50.176-1.536 4.608-6.656 6.656-10.752 5.12-4.608-1.536-6.656-6.656-5.12-10.752 7.68-22.016 18.432-40.448 31.232-55.296 55.296-64 160.768-84.48 164.864-85.504 3.584-0.512 7.68 1.024 9.216 4.608l45.056 100.352 48.128-100.352c1.536-3.584 5.632-5.12 9.216-4.608 4.608 1.024 110.592 21.504 174.08 83.968 62.976 62.464 52.736 190.464 52.224 196.096 0 4.096-4.096 7.68-8.192 7.68zM402.944 455.168c-1.536 0-3.584-0.512-4.608-2.048L345.088 394.752c-2.56-2.56-2.048-6.656 0.512-8.704 2.56-2.56 6.656-2.048 8.704 0.512l53.248 58.368c2.56 2.56 2.048 6.656-0.512 8.704-1.024 1.024-2.56 1.536-4.096 1.536z" fill="#2B77EF" p-id="6697"></path>
                        <path d="M398.336 345.6s180.736 4.096 210.432 49.664v-36.352s-143.36-36.352-210.432-13.312z" fill="#FFE3D9" p-id="6698"></path>
                        <path d="M478.208 335.872c44.544 0 86.528 8.704 122.368 24.576 7.68 3.584 16.896-2.56 16.896-10.752v-25.6c0-75.264-39.424-130.048-137.216-130.048C378.88 194.048 343.04 248.832 343.04 324.096V348.16c0 8.704 8.704 14.336 16.384 10.752 34.816-14.848 75.776-23.04 118.784-23.04z" fill="#C7DDFF" p-id="6699"></path>
                        <path d="M376.32 347.648v-24.064c0-71.168 31.744-123.392 119.808-129.536-5.12-0.512-10.752-0.512-16.384-0.512-101.376 0-137.216 54.784-137.216 130.048v24.064c0 8.704 8.704 14.336 16.384 10.752 5.632-2.56 11.776-4.608 17.92-6.656 0-1.024-0.512-2.56-0.512-4.096zM512 335.872c-5.632 0-11.264 0-16.896 0.512 38.4 2.048 73.728 10.24 104.96 24.064 6.656 3.072 9.216 3.584 11.264-2.56-31.232-11.776-61.952-22.016-99.328-22.016z" fill="#FFFFFF" p-id="6700"></path>
                        <path d="M605.184 369.664c-2.56 0-5.632-0.512-8.192-1.536-35.84-15.36-76.8-23.552-118.784-23.552-40.448 0-80.896 7.68-115.712 22.528-6.144 2.56-13.312 2.048-18.944-2.048-5.632-3.584-9.216-10.24-9.216-16.896v-24.064c0-90.624 50.176-138.24 145.92-138.24 94.208 0 145.92 49.152 145.92 138.24v25.6c0 6.656-3.584 13.312-9.216 16.896-4.096 2.048-7.68 3.072-11.776 3.072z m-126.976-42.496c44.032 0 87.552 8.704 125.44 25.088 1.536 0.512 2.56 0 3.072-0.512 0.512-0.512 1.536-1.024 1.536-3.072v-25.6c0-55.296-22.528-121.344-129.024-121.344-86.528 0-129.024 39.936-129.024 121.344v24.064c0 1.536 1.024 2.56 1.536 3.072 0.512 0.512 2.048 1.024 3.072 0.512 38.4-15.36 80.384-23.552 123.392-23.552z" fill="#2B77EF" p-id="6701"></path>
                        <path d="M582.656 325.632s-0.512 0 0 0c-4.096 0-6.656-3.072-6.144-6.656 1.536-20.48-2.048-38.4-10.752-52.736-1.536-3.072-1.024-6.656 2.048-8.704 3.072-1.536 6.656-1.024 8.704 2.048 9.728 16.384 13.824 36.864 12.288 59.904 0 3.584-3.072 6.144-6.144 6.144zM559.616 254.976c-1.536 0-3.072-0.512-4.096-1.536-2.048-2.048-3.584-3.584-5.632-5.12-3.584-2.56-6.144-3.584-6.144-3.584-3.072-1.536-4.608-5.12-3.072-8.192 1.536-3.072 5.12-4.608 8.192-3.072 0.512 0 3.584 1.536 8.192 5.12 2.56 2.048 4.608 4.096 7.168 6.144 2.56 2.56 2.56 6.144 0 8.704-1.024 1.024-2.56 1.536-4.608 1.536z" fill="#408CFF" p-id="6702"></path>
                        <path d="M553.472 456.192c-1.536 0-3.072-0.512-4.608-2.048-2.56-2.56-2.56-6.144 0-8.704l58.368-57.344c2.56-2.56 6.144-2.56 8.704 0s2.56 6.144 0 8.704l-58.368 57.344c-1.024 1.024-2.56 2.048-4.096 2.048z" fill="#2B77EF" p-id="6703"></path>
                        <path d="M419.328 698.368H339.456c-5.632 0-10.24-4.608-10.24-10.24s4.608-10.24 10.24-10.24h79.872c5.632 0 10.24 4.608 10.24 10.24s-4.608 10.24-10.24 10.24z" fill="#F68282" p-id="6704"></path>
                        <path d="M484.352 573.952c41.984 0 76.8-26.624 99.328-69.632-18.944-22.016-30.72-55.296-30.72-55.296H400.384c3.072 15.872-11.776 33.792-25.088 46.592 24.064 47.616 63.488 78.336 109.056 78.336z" fill="#FFFFFF" p-id="6705"></path>
                        <path d="M484.352 580.096c-46.08 0-88.064-29.696-114.176-81.92l-2.048-4.096 3.584-3.072c16.896-15.872 25.088-30.72 23.552-40.96l-1.536-7.168h163.84l1.536 4.096c0 0.512 11.776 32.768 29.696 53.76l2.56 3.072-2.048 3.584c-25.088 46.592-62.464 72.704-104.96 72.704zM382.976 496.64c24.064 45.056 60.928 71.168 101.376 71.168 36.864 0 69.12-22.016 91.648-62.464-14.336-17.92-24.064-40.96-27.648-50.176H407.04c-1.024 12.288-8.704 26.112-24.064 41.472z" fill="#2B77EF" p-id="6706"></path>
                    </svg>
                </i>
                医生列表
            </h3>
            <div class="col-md-12">
                <div class="col-md-12" id="order-box">
                    <div class="col-md-8 col-md-offset-2" id="order">
                        <div class="form-group form-group-box">
                            <div>
                                <label for="selectGrade" class="form-group-label">所属医院:</label>
                            </div>
                            <div>
                                <asp:DropDownList CssClass="form-control form-select" ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group form-group-box">
                            <div>
                                <label for="selectRegion" class="form-group-label">职称:</label>
                            </div>
                            <div>
                                <asp:DropDownList CssClass="form-control form-select" ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%
                for (int i = 0; i < doctor.Tables[0].Rows.Count; i++)
                {
                    Response.Write("<div class='col-md-4'>");
                    Response.Write("<div class='thumbnail'>");
                    Response.Write("<br/>");
                    Response.Write("<img src='" + Convert.ToString(doctor.Tables[0].Rows[i][@"DoctorImg"]).Substring(1) + "'/>");
                    Response.Write("<div class='caption'>");
                    Response.Write("<h2>" + Convert.ToString(doctor.Tables[0].Rows[i][@"DoctorRealName"]) + "</h2>");
                    Response.Write("<p>" + Convert.ToString(doctor.Tables[0].Rows[i][@"HospitaName"]) + "<br />" + Convert.ToString(doctor.Tables[0].Rows[i][@"DoctorPosition"]) + "</p>");
                    Response.Write("<p>" + Convert.ToString(doctor.Tables[0].Rows[i][@"DoctorDescribe"]).Substring(0, 50) + "......</p>");
                    Response.Write("<p class='btnGroup'>");
                    Response.Write("<a href='DoctorDetails.aspx?doctorID=" + Convert.ToString(doctor.Tables[0].Rows[i][@"doctorID"]) + "' class='btn btn-primary' >&nbsp;&nbsp;详情&nbsp;&nbsp;</a>");
                    Response.Write("</p>");
                    Response.Write("</div>");
                    Response.Write("</div>");
                    Response.Write("</div>");
                }
            %>
        </div>
    </div>
</asp:Content>
