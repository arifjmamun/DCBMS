<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="TestTypeSetup.aspx.cs" Inherits="DCBMS.UI.TestType" %>

<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="bodyContent" ContentPlaceHolderID="mainContent" runat="server">
    <!-- Content Header (Page header) -->
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <!-- right column -->
            <div class="col-md-12">
                <!-- Horizontal Form -->
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">Test Type Setup</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="form-horizontal">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="typeNameTextBox" class="col-sm-offset-3 col-sm-2 control-label">Type Name</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="typeNameTextBox" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-5 col-sm-3">
                                    <asp:Button CssClass="btn btn-info pull-right" ID="saveTestTypeBtn" runat="server" Text="Save" />
                                </div>
                            </div>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <div class="box-body no-padding">
                        <asp:GridView ID="testTypeGridView" runat="server" CssClass="table table-striped" ClientIDMode="Static" UseAccessibleHeader="True" GridLines="None">
                        </asp:GridView>
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
