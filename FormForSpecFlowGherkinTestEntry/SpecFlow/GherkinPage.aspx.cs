using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Collections;
using System.Text.RegularExpressions;

namespace SpecFlow
{
    public partial class GherkinPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            labelMessage.Text = "";
        }

        protected void SUBMIT_Click(object sender, EventArgs e)
        {
            //Get string data from the form
            string NameOfFeature = string.Format("{0}", Request.Form["FeatureName"]);
            string InOorderTo = string.Format("{0}", Request.Form["In_Order_To"]);
            string AsA = string.Format("{0}", Request.Form["As_a"]);
            string IWant = string.Format("{0}", Request.Form["I_want"]);
            string scenario = string.Format("{0}", Request.Form["Scenario"]);
            string SetUp = string.Format("{0}", Request.Form["Setup"]);
            string steps = string.Format("{0}", Request.Form["Steps"]);
            string result = string.Format("{0}", Request.Form["Result"]);
            string FileName = string.Format("{0}", Request.Form["filename"]);
            string tags = string.Format("{0}", Request.Form["Tags"]);

            string failure; //
            string svd; //this is the variable that we populate and direct the user to the success.aspx form

            if (Page.IsValid)
            {
                //DECLARE VARIABLES 
                string STATIC_EXTENSION = @".feature";
                string STATIC_BASEFILEPATH = @"c:\inetpub\wwwroot\FeatureFiles\";
                string STATIC_SEPERATOR = @"\";
                //END OF STATIC VARIABLES

                string ProjectRepositoryName;  //This should be the directory at the top level of the project, the one that contains the solution file.
                string fullFileName;
                //set counter to insure filename uniqueness
                int count = 1;

                //END OF VARIABLE DECLARATION

                string LowerCaseTags = tags.ToLower(); //make sure that everything is lower case.
                ProjectRepositoryName = containAPIorUI(LowerCaseTags) + STATIC_SEPERATOR;

                //if the optional field filename is empty use the feature name
                if (String.IsNullOrEmpty(FileName))
                    FileName = NameOfFeature;

                fullFileName = STATIC_BASEFILEPATH + ProjectRepositoryName + FileName + STATIC_EXTENSION;

                //check for existence of a file from previous uses if file existe silently increment file number
                if (System.IO.File.Exists(fullFileName))
                {
                    fullFileName = STATIC_BASEFILEPATH + ProjectRepositoryName + FileName + "_" + count + STATIC_EXTENSION;
                    while (System.IO.File.Exists(fullFileName))
                    {
                        ++count;
                        fullFileName = STATIC_BASEFILEPATH + ProjectRepositoryName + FileName + "_" + count + STATIC_EXTENSION;
                    }
                }//end if file exists block

                //Get a file system object to the file we wish to make/write to AKA a file handle
                System.IO.StreamWriter fileHandle = new System.IO.StreamWriter(fullFileName, true);

                //Write each text box line as a unique line
                fileHandle.WriteLine("Feature: " + NameOfFeature);
                fileHandle.WriteLine(InOorderTo);
                fileHandle.WriteLine(AsA);
                fileHandle.WriteLine(IWant);
                fileHandle.WriteLine(tags);
                fileHandle.WriteLine("Scenario: " + scenario);
                fileHandle.WriteLine(SetUp);
                fileHandle.WriteLine(steps);
                fileHandle.WriteLine(result);
                fileHandle.Close();


                svd = "success.aspx?pathInfo=" + fullFileName;
                Response.Redirect(svd);
            }//Close page valid
            else
            {
                failure = "failure.aspx?field=" + tags;
                Response.Redirect(failure);
            }
        }//end button submit class
        private string containAPIorUI(string inputString)
        {
            string APIorUI;
            string patternAPI = @"\b\w+api\b|@api";
            string patternUI = @"\b\w+ui\b|@ui";

            if (Regex.Matches(inputString, patternAPI).Count > 0)
            {
                APIorUI = "api";
            }//close if ther is an API pattern
            else if (Regex.Matches(inputString, patternUI).Count > 0)
            {
                APIorUI = "ui";
            }
            else
            {
                APIorUI = "No Match Found";
            }
            return APIorUI;
        }//end of contain API or UI

        protected void CustomTagsValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string toTest = args.Value;

            if (containAPIorUI(toTest).Equals("No Match Found"))
                args.IsValid = false;
            else
                args.IsValid = true;
        }// end of custom tags validator
    }
}