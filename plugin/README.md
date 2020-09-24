# AWS CLI Wrappers and Utility Scripts
## CUU - An AWS CLI Wrapper
###### Setup:  CUUHOME enviroment variable should be set to the cuu install directory
<pre>
</pre>
### Commands  
<pre>
ACCOUNTNUMBERALL      -a [-r]                    v1.0   Print all account numbers                     ACCOUNTNUMBERS ACCOUNTS 
AMISHARE              -a [-r]                    v2.0F  User listing                                  -
Command               Options                    Ver    Description                                   Aliases
CONI                  -a [-r]                    v1.0   Coni                                          -
CONSOLERESET1         -a [-r]                    v1.0F  Console1                                      -
CONSOLERESET          -a [-r]                    v1.0F  Console                                       RANNY 
COST                  -a [-r] -u                 v1.5   Cost report                                   -
COSTD                 -a -b -t                   v1.5   Cost report                                   COST5D 
COSTDAY               -a [-r] -u                 v2.0   Cost report last month to today (gnuplot)     -
COSTDETAIL            -a [-r] -u                 v1.5   Cost detail report                            -
COSTDETAILDAYS        -a -b -t                   v1.0   Cost detail report                            -
COSTMTDALL            -                          v1.0   Cost MTD ALL                                  -
COSTMTD               -a [-r]                    v1.0   Cost MTD                                      -
COSTYTD               -a [-r]                    v1.0   Cost YTD                                      -
DDBCREATETABLE        -a -t <table>              v1.0   Create a DynamoDB table                       -
DDBDELETETABLE        -a [-r] -u                 v1.0   Delete DynamoDB table                         -
DDBLS                 -a [-r] -u                 v1.0   List DynamoDB tables                          DDBLIST 
EC2RUNNING            -r                         v1.1   Running EC2 Instances                         RUNNING 
EC2SG                 -a [-r]                    v1.0   Security Group Detail Report                  -
EC2TAGS               -a [-r]                    v1.0   List EC2 Tags                                 ECT 
EC2TERMINATE          -a [-r] -t <id>            v1.1   Terminate Instance                            -
ELS                   -a [-r]                    v1.0   EC2 List with CPU Utilization                 ECPU ECPULS 
GROUPDELETE           -a -u -t <g>               v1.0   Delete group from profile by group name       -
GROUPLS               -a [-r]                    v1.0   List groups in profile                        GROUPLIST LISTGROUPS 
LAMBDADELETE          -a -r -t                   v2.1   Delete Lambda Function                        -
LAMBDALIST            -a -r                      v2.1   List Lambda Functions                         LAMBDALS 
LOGINPROFILECREATE    -a [-r] -u                 v1.0   Create Login Profile                          LPC 
PASSWORDCHANGE        -a [-r] -u                 v1.5   Change a users password (given pword)         CHANGEPASSWORD 
PASSWORDFORCE         -a [-r]                    v1.0   Password Reset                                PASSWORDFORCECHANGEE 
PASSWORDNEXTLOGINCHANGEALL -a [-r]                    v1.0F  All Useris must change password at next login PNLCALL 
PASSWORDNEXTLOGINCHANGE -a [-r] -u                 v1.0F  User must change password at next login       PNLC 
PASSWORDRESET         -a [-r]                    v1.0   Password Reset                                RESET 
PASSWORDRESETCAN      -a [-r]                    v1.0   Password Reset                                RESETCAN 
PASSWORDRESETX        -a [-r]                    v1.0   Password Reset                                RESETX 
POLICYATTACHADMIN     -a [-r] -u                 v1.0   Attach admin policy to user                   ADMINACCESS 
POLICYATTACHREADONLY  -a [-r] -u                 v1.0   Attach readonly policy to user                READONLYACCESS 
POLICYDETACH          -a [-r] -u -t arn          v1.0   Detach policy from user                       -
POLICYDOCCREATE       -                          v1.0   Clone this.json from policydoc.json template  -
POLICYDOCEDIT         -                          v1.0   Edit this.json                                -
POLICYDOCTEMPLATE     -                          v1.0   Display policydoc.json template               -
POLICYLISTALL         -a [-r]                    v1.0   List all policies                             LISTALLPOLICIES POLICYLS 
POLICYLISTAWS         -a [-r]                    v1.0   List all AWS policies                         LISTAWSPOLICIES 
POLICYLISTLOCAL       -a [-r]                    v1.0   List local policies                           LISTLOCALPOLICIES 
POLICYLISTUSER        -a [-r] -u                 v1.0   List policies atttached to user               LISTUSERPOLICIES 
POLICYUSERDETACHALL   -a [-r] -u                 v1.0   Detach all policies from user                 DETACHUSERPOLICIES 
RANNY100              -a [-r]                    v1.0F  Console                                       -
ROLELS                -a [-r]                    v1.1   List Roles                                    ROLESLIST LISTROLES 
S3COPY-1MINUTE        -a -b -d                   v1.5   Copy Document to S3, Expires in 1 Minute      S3C1M 
S3CREATEBUCKET        -a [-r] -b                 v1.2   Create S3 Bucket                              S3CB 
S3DELETEBUCKET        -a [-r] -b                 v1.0   Delete S3 Bucket                              S3RB 
S3GET                 -a -b -d                   v1.5   Get S3 object                                 -
S3GETEM               -a -b -d                   v1.5   Get S3 object                                 -
S3LS                  -a [-r] [-b]               v1.0   List S3                                       S3LIST LB 
S3LSR                 -a [-r] [-b]               v1.0   List S3 (recursive)                           S3LISTR LBR 
S3PUT                 -a -b -d [-k]              v1.5   Put document into bucket (opt key)            -
S3PUTPDF              -a [-r] -b -k -d           v1.5   Put S3 PDF Object                             -
SBX                   -a [-r] -u                 v1.1   Reset useir password to a random password     -
SCRAM                 -a [-r] -u                 v1.6   Make a users password unknown                 -
SQSLIST               -a -r -t                   v1.1   List SQS                                      SQSLS 
UCA2                  -a [-r] -u -p [-t <g>]     v1.1F  Create admin user                             -
USERCREATEADMIN       -a [-r] -u -p [-t <g>]     v1.1F  Create admin user                             CREATEADMINUSER UCA 
USERCREATE            -a [-r] -u -p [-t <g>]     v1.1   Create a user and assign access keys          CREATEUSER 
USERCREATEDEFAULT     -a [-r] -u                 v1.5   Create a user with default settings           CREATEDEFAULTUSER CDU 
USERCREATENOKEY       -a [-r] -u -p [-t <g>]     v1.1F  Create user with no access keys               CREATEUSERNOKEY UCNK 
USERCREATEREADONLY    -a [-r] -u -p [-t <g>]     v1.1   Create readonly user                          CREATEREADONLYUSER 
USERDELETE            -a [-r] -u                 v1.0F  Delete user                                   DELETEUSER 
USERDESCRIBE          -a [-r] -u                 v2.5   List groups & policies a/w user or userlist   DESCRIBEUSERS DU 
USERLA                -a [-r]                    v2.0F  User listing                                  -
USERLASTUSED          -a [-r]                    v2.0F  User last used                                ULU 
USERLIFE              -a [-r]                    v1.0   User life listing                             LF 
USERLS                -a [-r]                    v2.0F  User listing                                  USERLIST LISTUSERS LU 
USERLSJSON            -a [-r]                    v1.1   List users (json format)                      USERLISTJSON LUJ 
USERLSS               -a [-r]                    v2.0   User listing in simple format                 LUS 
UTILACCOUNTNUMBER     -a [-r]                    v1.1   Print account number                          ACCOUNTNUMBER 
UTILCONSOLE           -a [-r]                    v1.0   Open AWS Console                              CONSOLE 
UTILCONSOLERESET      -a [-r]                    v1.0   Open Reset and AWS Console                    -
UTILINFO              -a [-r]                    v1.0   Account Info                                  INFO 
UTILOGINURL           -a [-r]                    v1.0   Print console login URL                       LOGINURL URL 
UTILSET               -                          v1.5   Set & show config/env variables               SET 
VOLUMELS              -a [-r]                    v1.0   Volume List                                   VOLLS 
VPCCREATE             -a [-r]                    v1.0   Create a Two Subnet VPC                       CREATEVPC-2SUBNETS 
VPCDELETE             -a -r -t                   v1.0   Delete VPC                                    DELETEVPC 
VPCLIST               -a [-r]                    v1.1   List VPCs                                     VPCLS 
XXXPASSWORDRESET      -a [-r] -u                 v1.1   Reset useir password to a random password     OLDRESET XXXPASSWORD 
ZAP                   -a [-r] -u                 v1.1   Reset useir password to a random password     -
</pre>
### ~/.cuu.txt can contain defaults for these settings
<pre>
</pre>
### Build Date
<pre>
Wed Sep 23 22:57:37 EDT 2020
</pre>
