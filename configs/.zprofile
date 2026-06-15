eval "$(/opt/homebrew/bin/brew shellenv)"

# Add .NET Core SDK tools
export PATH="$PATH:/Users/vetleh/.dotnet/tools"

# Setting PATH for Python 3.14
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.14/bin:${PATH}"
export PATH
