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
                                    <asp:TextBox ID="dobTextBox" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
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
                                    <asp:TextBox ID="feeTextBox" runat="server" CssClass="form-control pull-left" ClientIDMode="Static" Enabled="False"></asp:TextBox>
                                </div>
                                <div class="col-sm-1">
                                    <asp:Button CssClass="btn btn-info pull-right" ID="addRequestEntryBtn" runat="server" Text="Add" OnClick="addRequestEntryBtn_Click" />
                                </div>
                            </div>

                            <hr />
                            <asp:GridView ID="testRequestEntryGridView" runat="server" CssClass="table table-striped" ClientIDMode="Static" GridLines="None" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True">
                                <Columns>
                                    <asp:BoundField DataField="slColumn" HeaderText="SL" />
                                    <asp:BoundField DataField="testNameColumn" HeaderText="Test" />
                                    <asp:BoundField DataField="feeColumn" HeaderText="Fee" />
                                </Columns>
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
                                    <asp:Button CssClass="btn btn-info pull-right" ID="saveEntriesButton" runat="server" Text="Save" />
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
    </section>
    <!-- /.content -->
</asp:Content>
