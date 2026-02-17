function mergecsv --description 'Merge multiple CSV files into one, skipping headers of all but the first file.'
    if test (count $argv) -lt 1
        echo "Usage: mergecsv file1.csv file2.csv ..."
        return 1
    end

    awk 'FNR==1 && NR!=1 {next} {print}' $argv
end

