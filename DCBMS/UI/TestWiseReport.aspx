<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="TestWiseReport.aspx.cs" Inherits="DCBMS.UI.TestWiseReport" EnableEventValidation="false" %>

<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="bodyContent" ContentPlaceHolderID="mainContent" runat="server">
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <!-- right column -->
            <div class="col-md-12">
                <!-- Horizontal Form -->
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">Test Wise Report</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="form-horizontal">
                        <div class="box-body">

                            <!--Alert goes here-->
                            <div class="col-sm-offset-3 col-sm-6">
                                <asp:Panel CssClass="alert alert-warning alert-dismissible" runat="server" ID="warningPanel" ClientIDMode="Static" Visible="False">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                    <h4 id="errorName" runat="server"></h4>
                                    <span runat="server" id="errorText"></span>
                                </asp:Panel>
                            </div>
                            <!--Alert ends-->

                            <!--From Date-->
                            <div class="form-group">
                                <label for="fromDateTextBox" class="col-sm-offset-3 col-sm-2 control-label">From Date</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="fromDateTextBox" runat="server" CssClass="form-control dateCalander" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                            <!--To Date-->
                            <div class="form-group">
                                <label for="toDateTextBox" class="col-sm-offset-3 col-sm-2 control-label">To Date</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="toDateTextBox" runat="server" CssClass="form-control dateCalander" ClientIDMode="Static"></asp:TextBox>
                                </div>
                                <div class="col-sm-3">
                                    <asp:Button CssClass="btn btn-info" ID="showReportBtn" runat="server" Text="Show" OnClick="showReportBtn_Click" />
                                </div>
                            </div>
                            <hr />
                            <asp:Panel runat="server" ID="gridViewWrapper">
                                <h1 runat="server" Visible="False" id="reportHeading" align="center">Test Wise Report</h1>
                                <asp:GridView ID="testWiseReportGridView" runat="server" CssClass="table table-striped" ClientIDMode="Static" GridLines="None" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" AllowPaging="True">
                                    <Columns>
                                        <asp:TemplateField HeaderText="SL">
                                            <ItemTemplate><%#Eval("Serial") %></ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Test Name">
                                            <ItemTemplate><%#Eval("TestName") %></ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Total Test">
                                            <ItemTemplate><%#Eval("TotalTest") %></ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Total Amount">
                                            <ItemTemplate><%#Eval("TotalAmount") %></ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>No Record Available</EmptyDataTemplate>
                                </asp:GridView>
                            </asp:Panel>
                            <hr />
                            <!--Total-->
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-1">
                                    <asp:Button CssClass="btn btn-info pull-right" ID="generatePdfButton" runat="server" Text="PDF" OnClick="generatePdfButton_Click" />
                                </div>
                                <label for="totalTextBox" class="col-sm-2 control-label">Total</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="totalTextBox" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <!-- /.box-body -->
                    </div>
                </div>
                <!-- /.box -->
            </div>
            <!--/.col (right) -->
        </div>
        <!-- /.row -->
    </section>
    <!-- /.content -->
</asp:Content>
