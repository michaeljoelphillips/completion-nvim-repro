<?php

declare(strict_types=1);

namespace CompletionRepro;

use stdClass;

class HelloWorld
{
    // private stdClass $thisPropertyBreaksCompletion;

    public function foo(): self
    {
        return $this;
    }

    public function bar(): stdClass
    {
        return new stdClass;
    }
}
