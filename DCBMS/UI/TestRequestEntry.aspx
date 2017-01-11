<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="TestRequestEntry.aspx.cs" Inherits="DCBMS.UI.TestRequest" %>

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
                        <h3 class="box-title">Test Request Entry</h3>
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

                            <!--Name of the Patient-->
                            <div class="form-group">
                                <label for="patientNameTextBox" class="col-sm-offset-3 col-sm-2 control-label">Name of the Patient</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="patientNameTextBox" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                            <!--Date of birth-->
                            <div class="form-group">
                                <label for="dobTextBox" class="col-sm-offset-3 col-sm-2 control-label">Date of Birth</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="dobTextBox" runat="server" CssClass="form-control dateCalander" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                            <!--Mobile No-->
                            <div class="form-group">
                                <label for="mobileNoTextBox" class="col-sm-offset-3 col-sm-2 control-label">Mobile No.</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="mobileNoTextBox" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                            <!--Select TestSetup-->
                            <div class="form-group">
                                <label for="selectTestDropDown" class="col-sm-offset-3 col-sm-2 control-label">Select Test</label>
                                <div class="col-sm-3">
                                    <asp:DropDownList ID="selectTestDropDown" runat="server" CssClass="form-control" ClientIDMode="Static">
                                        <asp:ListItem Text="Select One" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <!--Fee-->
                            <div class="form-group">
                                <label for="feeTextBox" class="col-sm-offset-3 col-sm-2 control-label">Fee</label>
                                <div class="col-sm-2">
                                    <asp:TextBox ID="feeTextBox" runat="server" CssClass="form-control pull-left" ClientIDMode="Static"></asp:TextBox>
                                </div>
                                <div class="col-sm-1">
                                    <asp:Button CssClass="btn btn-info pull-right" ID="addRequestEntryBtn" runat="server" Text="Add" OnClick="addRequestEntryBtn_Click" />
                                </div>
                            </div>

                            <hr />
                            <asp:GridView ID="testRequestEntryGridView" runat="server" CssClass="table table-striped" ClientIDMode="Static" GridLines="None" AutoGenerateColumns="True" ShowHeaderWhenEmpty="True">
                                <EmptyDataTemplate>No Record Available</EmptyDataTemplate>
                            </asp:GridView>
                            <hr />
                            <!--Total-->
                            <div class="form-group">
                                <label for="totalTextBox" class="col-sm-offset-8 col-sm-2 control-label">Total</label>
                                <div class="col-sm-2">
                                    <asp:TextBox ID="totalTextBox" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-9 col-sm-3">
                                    <asp:Button CssClass="btn btn-info pull-right" ID="saveEntriesButton" runat="server" Text="Save" OnClick="saveEntriesButton_Click" />
                                </div>
                            </div>
                        </div>
                        <!-- /.box-body -->
                    </div>
                </div>
            </div>
            <!--/.col (right) -->
        </div>
        <!-- /.row -->
        <asp:Panel CssClass="row" runat="server" ID="invoiceWrapper" Visible="False">
            <!-- Main content -->
            <section class="invoice">
                <h2 class="page-header" runat="server" align="center">Diagonostic Center Bill Management System </h2>
                <br />
                <small>Bill Date:
                    <asp:Label runat="server" ID="billdateLabel"></asp:Label>
                </small>
                <!-- info row -->
                <div class="row invoice-info">
                    <!-- /.col -->
                    <div class="col-sm-4 invoice-col">
                        To,
                        <br />
                        <strong>Name:
                            <asp:Label runat="server" ID="patientNameLabel"></asp:Label></strong><br />
                        Birth Date:
                        <asp:Label runat="server" ID="birthDateLabel"></asp:Label><br />
                        Mobile Number:
                        <asp:Label runat="server" ID="mobileNumberLabel"></asp:Label>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-4 invoice-col">
                        <b>Bill No. #</b><asp:Label runat="server" ID="billIdLabel"></asp:Label><br />
                        <br>
                        <b>Total Amount:</b>
                        <asp:Label runat="server" ID="totalAmountLabel"></asp:Label><br />
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->

                <!-- Table row -->
                <div class="row">
                    <div class="col-xs-12 table-responsive">
                        <asp:GridView ID="patientBillGridview" runat="server" CssClass="table table-striped" ClientIDMode="Static" GridLines="Both" AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField HeaderText="SL">
                                    <ItemTemplate><%#Eval("TestSerial") %></ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Test Name">
                                    <ItemTemplate><%#Eval("TestName") %></ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Fee">
                                    <ItemTemplate><%#Eval("TestFee") %></ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </section>
            <!-- /.content -->
        </asp:Panel>
    </section>
    <!-- /.content -->
</asp:Content>
