// Power BI Desktop > Transform data > Advanced Editor.
// Update FilePath to the location of the synthetic CSV on your computer.
let
    FilePath = "C:\\YOUR_PATH\\synthetic_monthly_operations.csv",
    Source = Csv.Document(File.Contents(FilePath), [Delimiter=",", Columns=12, Encoding=65001, QuoteStyle=QuoteStyle.Csv]),
    Headers = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    ChangedTypes = Table.TransformColumnTypes(Headers, {
        {"MonthStart", type date}, {"Year", Int64.Type}, {"Month", Int64.Type},
        {"Region", type text}, {"Team", type text}, {"ServiceCategory", type text},
        {"RequestsReceived", Int64.Type}, {"RequestsCompleted", Int64.Type},
        {"RequestsPending", Int64.Type}, {"RequestsOverdue", Int64.Type},
        {"QualityFlags", Int64.Type}, {"AvgResolutionDays", type number}
    })
in
    ChangedTypes
