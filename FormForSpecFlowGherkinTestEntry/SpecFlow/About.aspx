<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="SpecFlow.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><% %>SpecFlow Form</h2>
    <h3>SpecFlow form to submit Gherkin language feature files for Automation.</h3>
    <p>revision one version 6.  This version contains light form validation and tag parsing so that we can save feature files into the correct automation project ui or api.  This form will verify that the data meets minimum requirements and save the data as a unix type .feature file to the correct directory structure.</p>

</asp:Content>
