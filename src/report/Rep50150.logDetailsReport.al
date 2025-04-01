report 50150 logDetailsReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './logDetailsReport.rdl';

    dataset
    {
        dataitem("Log Details"; "Log Details")
        {
            column(item_no; item_no) { }
            column(user_name; user_name) { }
            column(message; message) { }
        }
    }

    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(LayoutName)
                {

                }
            }
        }
    }

    var
        myInt: Integer;
}