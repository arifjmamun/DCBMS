<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="TestTypeSetup.aspx.cs" Inherits="DCBMS.UI.TestType" %>

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
                        <h3 class="box-title">Test Type Setup</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="form-horizontal">
                        <div class="box-body">
                            
                            <!--Alert goes here-->
                            <asp:Panel CssClass="alert alert-warning alert-dismissible" runat="server" ID="warningPanel" ClientIDMode="Static" Visible="False">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                <h4 id="errorName"  runat="server"></h4>
                                <span runat="server" id="errorText"></span>
                            </asp:Panel>
                            <!--Alert ends-->

                            <div class="form-group">
                                <label for="typeNameTextBox" class="col-sm-offset-3 col-sm-2 control-label">Type Name</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="typeNameTextBox" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-5 col-sm-3">
                                    <asp:Button CssClass="btn btn-info pull-right" ID="saveTestTypeBtn" runat="server" Text="Save" OnClick="saveTestTypeBtn_Click" />
                                </div>
                            </div>

                            <hr />
                            <asp:GridView ID="testTypeGridView" runat="server" CssClass="table table-striped" ClientIDMode="Static" GridLines="None" AutoGenerateColumns="True" ShowHeaderWhenEmpty="True">
                                <EmptyDataTemplate>No Record Available</EmptyDataTemplate>
                            </asp:GridView>
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
