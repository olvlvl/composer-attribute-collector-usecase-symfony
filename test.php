<?php

use olvlvl\ComposerAttributeCollector\Attributes;
use Symfony\Component\Routing\Annotation\Route;

require_once 'vendor/autoload.php';

$targets = Attributes::filterTargetMethods(
    Attributes::predicateForAttributeInstanceOf(Route::class)
);

foreach ($targets as $target) {
    echo "action: $target->class#$target->name, path: {$target->attribute->getPath()}\n";
}
