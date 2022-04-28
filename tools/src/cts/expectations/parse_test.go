// Copyright 2022 The Dawn Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package expectations_test

import (
	"testing"

	"dawn.googlesource.com/dawn/tools/src/cts/expectations"
	"dawn.googlesource.com/dawn/tools/src/cts/result"
	"github.com/google/go-cmp/cmp"
)

func TestParse(t *testing.T) {
	type Test struct {
		name      string
		in        string
		expect    expectations.Content
		expectErr string
	}
	for _, test := range []Test{
		{
			name:   "empty",
			in:     ``,
			expect: expectations.Content{},
		}, /////////////////////////////////////////////////////////////////////
		{
			name: "single line comment",
			in:   `# a comment`,
			expect: expectations.Content{
				Chunks: []expectations.Chunk{
					{Comments: []string{`# a comment`}},
				},
			},
		}, /////////////////////////////////////////////////////////////////////
		{
			name: "single line comment, followed by newline",
			in: `# a comment
`,
			expect: expectations.Content{
				Chunks: []expectations.Chunk{
					{Comments: []string{`# a comment`}},
				},
			},
		}, /////////////////////////////////////////////////////////////////////
		{
			name: "newline, followed by single line comment",
			in: `
# a comment`,
			expect: expectations.Content{
				Chunks: []expectations.Chunk{
					{},
					{Comments: []string{`# a comment`}},
				},
			},
		}, /////////////////////////////////////////////////////////////////////
		{
			name: "comments separated by single newline",
			in: `# comment 1
# comment 2`,
			expect: expectations.Content{
				Chunks: []expectations.Chunk{
					{
						Comments: []string{
							`# comment 1`,
							`# comment 2`,
						},
					},
				},
			},
		}, /////////////////////////////////////////////////////////////////////
		{
			name: "comments separated by two newlines",
			in: `# comment 1

# comment 2`,
			expect: expectations.Content{
				Chunks: []expectations.Chunk{
					{Comments: []string{`# comment 1`}},
					{},
					{Comments: []string{`# comment 2`}},
				},
			},
		}, /////////////////////////////////////////////////////////////////////
		{
			name: "comments separated by multiple newlines",
			in: `# comment 1



# comment 2`,
			expect: expectations.Content{
				Chunks: []expectations.Chunk{
					{Comments: []string{`# comment 1`}},
					{},
					{Comments: []string{`# comment 2`}},
				},
			},
		}, /////////////////////////////////////////////////////////////////////
		{
			name: "expectation, single result",
			in:   `abc,def [ FAIL ]`,
			expect: expectations.Content{
				Chunks: []expectations.Chunk{
					{
						Expectations: []expectations.Expectation{
							{
								Line:   1,
								Tags:   result.NewTags(),
								Query:  "abc,def",
								Status: []string{"FAIL"},
							},
						},
					},
				},
			},
		}, /////////////////////////////////////////////////////////////////////
		{
			name: "expectation, with comment",
			in:   `abc,def [ FAIL ] # this is a comment`,
			expect: expectations.Content{
				Chunks: []expectations.Chunk{
					{
						Expectations: []expectations.Expectation{
							{
								Line:    1,
								Tags:    result.NewTags(),
								Query:   "abc,def",
								Status:  []string{"FAIL"},
								Comment: "# this is a comment",
							},
						},
					},
				},
			},
		}, /////////////////////////////////////////////////////////////////////
		{
			name: "expectation, multiple results",
			in:   `abc,def [ FAIL SLOW ]`,
			expect: expectations.Content{
				Chunks: []expectations.Chunk{
					{
						Expectations: []expectations.Expectation{
							{
								Line:   1,
								Tags:   result.NewTags(),
								Query:  "abc,def",
								Status: []string{"FAIL", "SLOW"},
							},
						},
					},
				},
			},
		}, /////////////////////////////////////////////////////////////////////
		{
			name: "expectation, with single tag",
			in:   `[ Win ] abc,def [ FAIL ]`,
			expect: expectations.Content{
				Chunks: []expectations.Chunk{
					{
						Expectations: []expectations.Expectation{
							{
								Line:   1,
								Tags:   result.NewTags("Win"),
								Query:  "abc,def",
								Status: []string{"FAIL"},
							},
						},
					},
				},
			},
		}, /////////////////////////////////////////////////////////////////////
		{
			name: "expectation, with multiple tags",
			in:   `[ Win Mac ] abc,def [ FAIL ]`,
			expect: expectations.Content{
				Chunks: []expectations.Chunk{
					{
						Expectations: []expectations.Expectation{
							{
								Line:   1,
								Tags:   result.NewTags("Win", "Mac"),
								Query:  "abc,def",
								Status: []string{"FAIL"},
							},
						},
					},
				},
			},
		}, /////////////////////////////////////////////////////////////////////
		{
			name: "expectation, with bug",
			in:   `crbug.com/123 abc,def [ FAIL ]`,
			expect: expectations.Content{
				Chunks: []expectations.Chunk{
					{
						Expectations: []expectations.Expectation{
							{
								Line:   1,
								Bug:    "crbug.com/123",
								Tags:   result.NewTags(),
								Query:  "abc,def",
								Status: []string{"FAIL"},
							},
						},
					},
				},
			},
		}, /////////////////////////////////////////////////////////////////////
		{
			name: "expectation, with bug and tag",
			in:   `crbug.com/123 [ Win ] abc,def [ FAIL ]`,
			expect: expectations.Content{
				Chunks: []expectations.Chunk{
					{
						Expectations: []expectations.Expectation{
							{
								Line:   1,
								Bug:    "crbug.com/123",
								Tags:   result.NewTags("Win"),
								Query:  "abc,def",
								Status: []string{"FAIL"},
							},
						},
					},
				},
			},
		}, /////////////////////////////////////////////////////////////////////
		{
			name: "expectation, with comment",
			in: `# a comment
crbug.com/123 [ Win ] abc,def [ FAIL ]`,
			expect: expectations.Content{
				Chunks: []expectations.Chunk{
					{
						Comments: []string{`# a comment`},
						Expectations: []expectations.Expectation{
							{
								Line:   2,
								Bug:    "crbug.com/123",
								Tags:   result.NewTags("Win"),
								Query:  "abc,def",
								Status: []string{"FAIL"},
							},
						},
					},
				},
			},
		}, /////////////////////////////////////////////////////////////////////
		{
			name: "expectation, with multiple comments",
			in: `# comment 1
# comment 2
crbug.com/123 [ Win ] abc,def [ FAIL ]`,
			expect: expectations.Content{
				Chunks: []expectations.Chunk{
					{
						Comments: []string{`# comment 1`, `# comment 2`},
						Expectations: []expectations.Expectation{
							{
								Line:   3,
								Bug:    "crbug.com/123",
								Tags:   result.NewTags("Win"),
								Query:  "abc,def",
								Status: []string{"FAIL"},
							},
						},
					},
				},
			},
		}, /////////////////////////////////////////////////////////////////////
		{
			name: "comment, test, newline, comment",
			in: `# comment 1
crbug.com/123 abc_def [ Skip ]

### comment 2`,
			expect: expectations.Content{
				Chunks: []expectations.Chunk{
					{
						Comments: []string{`# comment 1`},
						Expectations: []expectations.Expectation{
							{
								Line:   2,
								Bug:    "crbug.com/123",
								Tags:   result.NewTags(),
								Query:  "abc_def",
								Status: []string{"Skip"},
							},
						},
					},
					{},
					{Comments: []string{`### comment 2`}},
				},
			},
		}, /////////////////////////////////////////////////////////////////////
		{
			name: "complex",
			in: `# comment 1

# comment 2
# comment 3

crbug.com/123 [ Win ] abc,def [ FAIL ]

# comment 4
# comment 5
crbug.com/456 [ Mac ] ghi_jkl [ PASS ]
# comment 6

# comment 7
`,
			expect: expectations.Content{
				Chunks: []expectations.Chunk{
					{Comments: []string{`# comment 1`}},
					{},
					{Comments: []string{`# comment 2`, `# comment 3`}},
					{},
					{
						Expectations: []expectations.Expectation{
							{
								Line:   6,
								Bug:    "crbug.com/123",
								Tags:   result.NewTags("Win"),
								Query:  "abc,def",
								Status: []string{"FAIL"},
							},
						},
					},
					{},
					{
						Comments: []string{`# comment 4`, `# comment 5`},
						Expectations: []expectations.Expectation{
							{
								Line:   10,
								Bug:    "crbug.com/456",
								Tags:   result.NewTags("Mac"),
								Query:  "ghi_jkl",
								Status: []string{"PASS"},
							},
						},
					},
					{Comments: []string{`# comment 6`}},
					{},
					{Comments: []string{`# comment 7`}},
				},
			},
		}, /////////////////////////////////////////////////////////////////////
		{
			name: "tag header",
			in: `
# BEGIN TAG HEADER (autogenerated, see validate_tag_consistency.py)
# Devices
# tags: [ duck-fish-5 duck-fish-5x duck-horse-2 duck-horse-4
#             duck-horse-6 duck-shield-duck-tv
#         mouse-snake-frog mouse-snake-ant mouse-snake
#         fly-snake-bat fly-snake-worm fly-snake-snail-rabbit ]
# Platform
# tags: [ hamster
#         lion ]
# Driver
# tags: [ goat.1 ]
# END TAG HEADER
`,
			expect: expectations.Content{
				Chunks: []expectations.Chunk{
					{},
					{Comments: []string{
						`# BEGIN TAG HEADER (autogenerated, see validate_tag_consistency.py)`,
						`# Devices`,
						`# tags: [ duck-fish-5 duck-fish-5x duck-horse-2 duck-horse-4`,
						`#             duck-horse-6 duck-shield-duck-tv`,
						`#         mouse-snake-frog mouse-snake-ant mouse-snake`,
						`#         fly-snake-bat fly-snake-worm fly-snake-snail-rabbit ]`,
						`# Platform`,
						`# tags: [ hamster`,
						`#         lion ]`,
						`# Driver`,
						`# tags: [ goat.1 ]`,
						`# END TAG HEADER`,
					}},
				},
				Tags: expectations.Tags{
					ByName: map[string]expectations.TagSetAndPriority{
						"duck-fish-5":            {Set: "Devices", Priority: 0},
						"duck-fish-5x":           {Set: "Devices", Priority: 1},
						"duck-horse-2":           {Set: "Devices", Priority: 2},
						"duck-horse-4":           {Set: "Devices", Priority: 3},
						"duck-horse-6":           {Set: "Devices", Priority: 4},
						"duck-shield-duck-tv":    {Set: "Devices", Priority: 5},
						"mouse-snake-frog":       {Set: "Devices", Priority: 6},
						"mouse-snake-ant":        {Set: "Devices", Priority: 7},
						"mouse-snake":            {Set: "Devices", Priority: 8},
						"fly-snake-bat":          {Set: "Devices", Priority: 9},
						"fly-snake-worm":         {Set: "Devices", Priority: 10},
						"fly-snake-snail-rabbit": {Set: "Devices", Priority: 11},
						"hamster":                {Set: "Platform", Priority: 0},
						"lion":                   {Set: "Platform", Priority: 1},
						"goat.1":                 {Set: "Driver", Priority: 0},
					},
					Sets: []expectations.TagSet{
						{
							Name: "Devices",
							Tags: result.NewTags(
								"duck-fish-5", "duck-fish-5x", "duck-horse-2",
								"duck-horse-4", "duck-horse-6", "duck-shield-duck-tv",
								"mouse-snake-frog", "mouse-snake-ant", "mouse-snake",
								"fly-snake-bat", "fly-snake-worm", "fly-snake-snail-rabbit",
							),
						}, {
							Name: "Platform",
							Tags: result.NewTags("hamster", "lion"),
						}, {
							Name: "Driver",
							Tags: result.NewTags("goat.1"),
						},
					},
				},
			},
		}, /////////////////////////////////////////////////////////////////////
		{
			name:      "err missing tag ']'",
			in:        `[`,
			expectErr: "1:2: expected ']' for tags",
		}, /////////////////////////////////////////////////////////////////////
		{
			name:      "err missing test query",
			in:        `[ a ]`,
			expectErr: "1:6: expected test query",
		}, /////////////////////////////////////////////////////////////////////
		{
			name:      "err missing status EOL",
			in:        `[ a ] b`,
			expectErr: "1:8: expected status",
		}, /////////////////////////////////////////////////////////////////////
		{
			name:      "err missing status comment",
			in:        `[ a ] b # c`,
			expectErr: "1:9: expected status",
		}, /////////////////////////////////////////////////////////////////////
		{
			name:      "err missing status ']'",
			in:        `[ a ] b [ c`,
			expectErr: "1:12: expected ']' for status",
		},
	} {

		got, err := expectations.Parse(test.in)
		errMsg := ""
		if err != nil {
			errMsg = err.Error()
		}
		if diff := cmp.Diff(errMsg, test.expectErr); diff != "" {
			t.Errorf("'%v': Parse() error %v", test.name, diff)
			continue
		}
		if diff := cmp.Diff(got, test.expect); diff != "" {
			t.Errorf("'%v': Parse() was not as expected:\n%v", test.name, diff)
		}
	}
}
