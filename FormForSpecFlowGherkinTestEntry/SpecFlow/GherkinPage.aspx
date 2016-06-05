<%@ Page ValidateRequest="false" Language="C#" AutoEventWireup="true"  CodeBehind="GherkinPage.aspx.cs" Inherits="SpecFlow.GherkinPage" %>
<!-- ValidateRequest is set to falso so that we can enter in the ghrekin characters to adequeatly describe a feature. 
     Web.config has also be edited requestValidationMode="2.0" was set in httpRuntime -->
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>

    <form id="form" runat="server" method="post">
    <div>
     
        <br />
        Feature Name:<br />
        <asp:TextBox ID="FeatureName" runat="server" ToolTip="What is the feature called in AHA or VSO" Width="350px" Height="30px"></asp:TextBox>
        <br />
    </div>

    <div>
             In Order To:<br />
        <asp:TextBox ID="In_Order_To" runat="server" ToolTip="In order to realize some business value" Width="350px" Height="30px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="In_Order_to_Validator" runat="server" ControlToValidate="In_Order_To" Display="Dynamic" ErrorMessage="In Order To: Field can not be blank" ValidationGroup="AllValidators">*</asp:RequiredFieldValidator>
        <br />
    </div>

    <div>
             As a:<br />
        <asp:TextBox ID="As_a" runat="server" ToolTip="What type of user is going to be using this feature?" Width="350px" Height="30px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="As_a_Validator" runat="server" ControlToValidate="As_a" Display="Dynamic" ErrorMessage="As a: Field can not be blank" ValidationGroup="AllValidators">*</asp:RequiredFieldValidator>
        <br />
    </div>

    <div>
             I want:<br />
        <asp:TextBox ID="I_want" runat="server" ToolTip="What would the user like to be able to do?" Width="350px" Height="30px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="I_want_Validator" runat="server" ControlToValidate="I_want" Display="Dynamic" ErrorMessage="I want: Field can not be blank" ValidationGroup="AllValidators">*</asp:RequiredFieldValidator>
        <br />
        <br />
    </div>

    <div>
             Tags:<br />
        <asp:TextBox ID="Tags" runat="server" ToolTip="Tags must begin with @ contain either ui or api and be descriptive of what you want the test to cover.  For Example @acceptance_ui, we know it is an acceptance test for the UI." Width="350px" Height="30px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="TagsValidator1" runat="server" ControlToValidate="Tags" Display="Dynamic" ErrorMessage="Tags are required the minimum tag is either @ui or @api" ValidationGroup="AllValidators">*</asp:RequiredFieldValidator>
        <asp:CustomValidator ID="CustomTagsValidator" runat="server" ControlToValidate="Tags" Display="Dynamic" ErrorMessage="Tags do not contain a test type indicator" OnServerValidate="CustomTagsValidator_ServerValidate" ValidationGroup="AllValidators">Tags requires api or ui indicator.</asp:CustomValidator>
        <br />
    </div>

    <div>
             Scenario:<br />
        <asp:TextBox ID="Scenario" runat="server" ToolTip="What user action are we describing?" Width="350px" Height="30px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="ScenarioValidator" runat="server" ControlToValidate="Scenario" Display="Dynamic" ErrorMessage="Scenario is a required field" ValidationGroup="AllValidators">*</asp:RequiredFieldValidator>
        <br />
    </div>

    <div>
             Set up:<br />
        <asp:TextBox ID="Setup" runat="server" ToolTip="What has the user already done?" Width="350px" Height="30px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="SetupValidator" runat="server" ControlToValidate="Setup" Display="Dynamic" ErrorMessage="This field must start with given and can not be empty." ValidationGroup="AllValidators">*</asp:RequiredFieldValidator>
        <br />
    </div>

    <div>
             Steps:<br />
        <asp:TextBox ID="Steps" runat="server" ToolTip="And User has done, When user does" TextMode="MultiLine" Width="350px" Height="150px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="StepsValidator" runat="server" ControlToValidate="Steps" Display="Dynamic" ErrorMessage="Steps are required" ValidationGroup="AllValidators">*</asp:RequiredFieldValidator>
        <br />
    </div>

    <div>
        Result:<br />
        <asp:TextBox ID="Result" runat="server" ToolTip="What should the user see or get at the end of all of this?" Width="350px" Height="30px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="ResultValidator" runat="server" ControlToValidate="Result" Display="Dynamic" ErrorMessage="Result: Field can not be empty" ValidationGroup="AllValidators">*</asp:RequiredFieldValidator>
        <br />
    </div>

    <div>
        <br />
        FileName:<br />
        <asp:TextBox ID="filename" runat="server" Height="30px" ToolTip="Optional filename, if one is not specified the file will be saved using the feature name." Width="350px"></asp:TextBox>
        <br />
    </div>

    <div>
        <br />
        <asp:Button ID="Submit" runat="server" Height="50px" Text="Save File" OnClick="SUBMIT_Click" Width="75px" ValidationGroup="AllValidators"/>
        <asp:Label ID="labelMessage" runat="server"></asp:Label>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="True" Font-Size="Large" ShowMessageBox="True" ValidationGroup="AllValidators" />
        <br />
    </div>  
    
    

    </form>
</body>
</html>
