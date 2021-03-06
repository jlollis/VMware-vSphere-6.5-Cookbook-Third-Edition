############################################################################################
##
## From Learning PowerShell DSC (Packt)
## by James Pogran (https://www.packtpub.com/networking-and-servers/learning-powershell-dsc)
##
############################################################################################

@{
  AllNodes = @(
    @{
      NodeName        = 'app01'
      ConfigurationId = 'ab2c2cb2-67a3-444c-bc55-cc2ee70e3d0c'
      Roles           = @('appserver')
    },
    @{
      NodeName        = 'app02'
      ConfigurationId = '8e8f44e6-aaac-4060-b072-c9ae780ee5f7'
      Roles           = @('appserver')
    },
    @{
      NodeName             = '*'
      RefreshMode          = 'Push'
      ConfigurationMode    = 'ApplyAndAutoCorrect'
      AllowModuleOverwrite = $true
      RebootNodeIfNeeded   = $true
      Apollo   = @{
        Name               = 'Apollo'
        ProductId          = '{e70c4829-91dc-4f0e-a404-4eba81f6feb9}'
        SourcePath         = 'http://build.pantheon.net/apollo/packages/releases/apollo.1.1.0.msi'
        Arguments          = ''
        ConfigFilePath     = "c:\ProgramFiles\Apollo\config\app.config"
        ConfigFileContents = "importantsetting=`$true"
      }
    }
  )
}
