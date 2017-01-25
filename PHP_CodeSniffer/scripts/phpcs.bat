@echo off
REM PHP_CodeSniffer tokenizes PHP code and detects violations of a
REM defined set of coding standards.
REM 
REM PHP version 5
REM 
REM @category  PHP
REM @package   PHP_CodeSniffer
REM @author    Greg Sherwood <gsherwood@squiz.net>
REM @author    Marc McIntyre <mmcintyre@squiz.net>
REM @copyright 2006-2014 Squiz Pty Ltd (ABN 77 084 670 600)
REM @license   https://github.com/squizlabs/PHP_CodeSniffer/blob/master/licence.txt BSD Licence
REM @link      http://pear.php.net/package/PHP_CodeSniffer

"f:\OpenServer\modules\php\PHP-5.5\php.exe" "c:\Users\Anton\PHP_CodeSniffer\scripts\phpcs" --standard=c:\Users\Anton\PHP_CodeSniffer\scripts\custom_ruleset.xml %*